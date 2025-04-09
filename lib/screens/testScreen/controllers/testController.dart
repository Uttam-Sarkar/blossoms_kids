import 'dart:convert';
import 'dart:math';
import 'package:blossoms_kids/screens/sessionScreen/controllers/sessionController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/routes/routesName.dart';
import '../../sessionScreen/view_model/sessionModel.dart';

class TestController extends SessionController {
  /// For test Screen
  var testCurrentSessionLevel = <String, int>{}.obs;
  var testCurrentLessonIndex = 0.obs;
  var testCurrentCategory = '';
  var testCurrentSession = Rxn<Session>(); // Holds the current session data

  var settingsShowLesson = true.obs;
  var showLesson = true.obs;

  var selectedIndex = (-1).obs;
  var isCorrect = false.obs;
  var showTestCompletionScreen = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAllTestSessionLevel();
  }

  Future<void> loadAllTestSessionLevel() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> categories = [
      "Emotion",
      "Family",
      "Living Skill",
      "Music",
      "Profession",
      "Psychological",
      "Social Skill",
      "Study"
    ]; // Add all categories// Add all categories

    for (var category in categories) {
      int testSessionLevel = prefs.getInt('testSession_$category') ??
          1; // Default sessionLevel is 1
      testCurrentSessionLevel[category] = testSessionLevel;
    }
  }

  Future<void> testSaveSession(String category, int testSessionNumber) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('testSession_$category', testSessionNumber);
    testCurrentSessionLevel[category] = testSessionNumber;
  }

  /// Load a session from assets
  Future<void> testStartSession(String category) async {
    testCurrentLessonIndex.value = 0;
    testCurrentCategory = category;
    int testSessionLevel = testCurrentSessionLevel[category] ?? 1;

    try {
      // Load JSON file
      String jsonString = await rootBundle.loadString(
          "lib/resources/assets/$category/sessions/sessions$testSessionLevel.json");
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // Convert JSON to Session object and update state
      testCurrentSession.value = Session.fromJson(jsonData);
      lessonLength = testCurrentSession.value!.lessons.length;
      // 'sessionLevel': currentSessionLevel[category], //for next line
      // Get.toNamed(RoutesName.testScreen, arguments: {'category': category, 'testCurrentSession' : testCurrentSession});
      Get.toNamed(RoutesName.testScreen);
    } catch (e) {
      if (kDebugMode) {
        print("Error loading session: $e");
      }
    }
  }

  @override
  Future<void> goToNextLesson() async {
    if (testCurrentLessonIndex.value == lessonLength - 1) {
      if (showTestCompletionScreen == false) {
        showTestCompletionScreen.value = true;
        Get.toNamed(RoutesName.testCompletion);
      } else {
        showTestCompletionScreen.value = false;
        String category = testCurrentCategory;
        var testSessionLevel = testCurrentSessionLevel[category];
        var totalSessions = totalSession[category];

        if (totalSessions! > testSessionLevel!) {
          await testSaveSession(category, testSessionLevel + 1);
          testStartSession(category);
        } else {
          testCurrentSessionLevel[category] = 1;
          testStartSession(category);
        }
      }

      print('session change lesson index = $testCurrentLessonIndex lessonLength = $lessonLength');
    } else if (testCurrentLessonIndex.value != null &&
        testCurrentLessonIndex.value < lessonLength - 1) {
      if(settingsShowLesson.value){
        showLesson.value ? showLesson.value = false : showLesson.value = true;
      }else{
        showLesson.value = false;
      }
      if(showLesson.value == false){
        generateOptions();
        testCurrentLessonIndex.value++;
      }

      if (kDebugMode) {
        print(
            'show value = $showLesson lesson index = $testCurrentLessonIndex lessonLength = $lessonLength');
      }
    }
  }

  int correctIndex = 0;
  List<int> options = <int>[].obs;

  void generateOptions() {
    Random random = Random();
    int correctOptionIndex = testCurrentLessonIndex.value;
    correctIndex = correctOptionIndex;

    Set<int> selectedOptionsIndex = {correctOptionIndex};

    while (selectedOptionsIndex.length < 4) {
      selectedOptionsIndex.add(random.nextInt(lessonLength));
    }
    options = selectedOptionsIndex.toList();
    options.shuffle(); // Shuffle for random order
  }

  void checkAnswer() {
    if (selectedIndex == correctIndex) {
      Get.snackbar("Correct!", "You selected the right image!",
          backgroundColor: const Color(0xFF4CAF50));
    } else {
      Get.snackbar("Wrong!", "Try again!",
          backgroundColor: const Color(0xFFF44336));
    }
    // generateOptions(); // Load new images

    // selectedIndex.value = index;
    // isCorrect.value = (index == 0); // Assuming index 0 is correct
  }
}

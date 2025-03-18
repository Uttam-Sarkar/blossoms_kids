import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../view_model/session_model.dart';

class SessionController extends GetxController {
  // var currentSession = Rx<Session?>(null);
  // var currentSession = Rx<Session>(Session.fromJson('sessionName': 'Session 1','lessons': [],));
  var currentSession = Rx<Session>(Session.fromJson({
    'sessionName': 'sessions1',
    'lessons': [{
      "lessonName": "Football",
      "imageAsset": "lib/resources/assets/study/images/football.jpg",
      "animationAsset": "lib/resources/assets/study/animations/football.lottie",
      "audioAsset": "lib/resources/assets/study/audio/football.mp3"
    },
      {
        "lessonName": "Football",
        "imageAsset": "lib/resources/assets/study/images/dj.jpg",
        "animationAsset": "lib/resources/assets/study/animations/football.lottie",
        "audioAsset": "lib/resources/assets/study/audio/football.mp3"
      }],
  }));



  var currentLessonIndex = 0.obs;

  // Load the session data from assets (for the first few sessions)
  Future<void> loadSession(String sessionFileName) async {
    try {
      String jsonString = await rootBundle.loadString('assets/study/sessions/$sessionFileName.json');
      Map<String, dynamic> sessionJson = json.decode(jsonString);
      currentSession.value = Session.fromJson(sessionJson);
    } catch (e) {
      print('Error loading session: $e');
    }
  }

  // Move to next lesson in the session
  void goToNextLesson() {
    if (currentSession.value != null && currentLessonIndex.value < currentSession.value!.lessons.length - 1) {
      currentLessonIndex.value++;
    }
  }

  // Move to previous lesson in the session
  void goToPreviousLesson() {
    if (currentLessonIndex.value > 0) {
      currentLessonIndex.value--;
    }
  }
}

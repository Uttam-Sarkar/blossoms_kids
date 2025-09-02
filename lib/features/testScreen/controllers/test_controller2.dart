// import 'package:blossoms_kids/features/testScreen/models/test_lesson_model.dart';
// import 'package:get/get.dart';
//
// class TestController2 extends GetxController {
//   var showLesson = true.obs; // Controlled by settings
//   var currentLesson = 0.obs;
//   var testLessons = <TestLessonModel>[].obs;
//   var selectedIndex = (-1).obs;
//   var isCorrect = false.obs;
//
//   @override
//   void onInit() {
//     loadTestLessons();
//     super.onInit();
//   }
//
//   void loadTestLessons() {
//     // Load lessons from practice content
//     testLessons.assignAll([
//       TestLessonModel(correctAnimation: 'apple.gif', falseAnimation: 'orange.gif', text: 'Apple')
//     ]);
//   }
//
//   void nextLesson() {
//     if (currentLesson.value < testLessons.length - 1) {
//       currentLesson.value++;
//       selectedIndex.value = -1;
//     }
//   }
//
//   void checkAnswer(int index) {
//     selectedIndex.value = index;
//     isCorrect.value = (index == 0); // Assuming index 0 is correct
//   }
// }
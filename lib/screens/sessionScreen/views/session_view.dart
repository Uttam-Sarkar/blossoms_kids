import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/session_controller.dart';

class SessionView extends StatelessWidget {
  final SessionController controller = Get.find();
  // final SessionController controller = Get.find();

  final String category = Get.arguments['category'];
  final int sessionLevel = Get.arguments['sessionLevel'];
  final currentSession = Get.arguments['currentSession'];

  SessionView({super.key});
  // var lesson = currentSession.value!.lessons[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learning Session')),
      body: Obx(() {
        int currentLessonIndex = controller.currentLessonIndex.value;
        // controller.currentLessonIndex.value = 0;
        var lesson = currentSession.value!.lessons[currentLessonIndex];
        var any = currentSession.value!.lessons.length;
        print('any = $any');

        // var sessionLevel = controller.currentSessionLevel.value;
        print("object");
        print(sessionLevel);
        print(currentSession.value!.lessons.length);
        print(lesson.lessonName);
        // if (sessionLevel == null) {
        //   return Center(child: CircularProgressIndicator());
        // }

        // var currentLesson = sessionLevel.lessons[controller.currentLessonIndex.value];
        // var currentLesson = sessionLevel.

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the image
            Image.asset(lesson!.imageAsset),

            // Display the animation (using lottie package)
            // You can use a package like "lottie" to show animations
            // Lottie.asset(currentLesson.animationAsset),  // Uncomment and use Lottie package

            // Play the audio (use the audio player package to play audio)
            ElevatedButton(
              onPressed: () {
                // Play the audio (use an audio player like "audioplayers")
                // AudioPlayer().play(currentLesson.audioAsset);  // Uncomment and use audio player package
              },
              child: Text('Play Sound'),
            ),

            SizedBox(height: 20),

            // Display Next/Previous buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: controller.goToPreviousLesson,
                  child: Text('Previous'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: controller.goToNextLesson,
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

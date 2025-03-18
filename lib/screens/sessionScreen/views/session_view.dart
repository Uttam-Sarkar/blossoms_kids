import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/session_controller.dart';

class SessionView extends StatelessWidget {
  final SessionController controller = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learning Session')),
      body: Obx(() {
        var session = controller.currentSession.value;
        print(session);
        // if (session == null) {
        //   return Center(child: CircularProgressIndicator());
        // }

        var currentLesson = session?.lessons[controller.currentLessonIndex.value];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the image
            Image.asset(currentLesson!.imageAsset),

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

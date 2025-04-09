import 'dart:math';

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/testController.dart';
// import '../controllers/testController2.dart';

class TestQuestionView extends StatelessWidget {
  final TestController controller = Get.find();
// final TestController controller =  Get.put(TestController(), permanent: true);

// Random random = Random();
// late final String category ;
// final late testCurrentSession;
// TestQuestionView(this.category, this.testCurrentSession);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var lesson = controller.testCurrentSession.value!;

        return Column(
          children: [
            // Optionally, if showLesson is true, show the learning lesson content here
            // if (controller.showLesson.value)
            //   Expanded(
            //       flex: 4,
            //       child: Center(
            //           child: Image.asset("assets/learning_placeholder.png"))
            //   ),

            // Options grid (4 options)
            Expanded(
              flex: 16,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: controller.options.length,
                  itemBuilder: (context, index) {
                    int optionIndex = controller.options[index];
                    bool isSelected =
                        controller.selectedIndex.value == optionIndex;
                    return GestureDetector(
                      onTap: () {
                        controller.selectedIndex.value = optionIndex;
                      },
                      child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      isSelected ? Colors.blue : Colors.black,
                                  width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                        child: DotLottieLoader.fromAsset(lesson.lessons[optionIndex].animationAsset,
                            frameBuilder: (ctx, dotlottie) {
                              if (dotlottie != null) {
                                return Lottie.memory(dotlottie.animations.values.single);
                              } else {
                                return Container();
                              }
                            }),
                          )

                    );
                  },
                ),
              ),
            ),

            // Check button
            Expanded(
              flex: 5 ,// Small section
              child: Center(
                child: Text(
                  lesson.lessons[controller.correctIndex].lessonName,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ),
          ],
        );

//         return Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // Two images in each row
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10,
//             ),
//             itemCount: 4,
//             itemBuilder: (context, index) {
// // ImageModel image = controller.options[index];
//               int selectedIndex = controller.options[index];
//
//               return GestureDetector(
//                 onTap: () => controller.checkAnswer(selectedIndex),
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: DotLottieLoader.fromAsset(
//                       lesson.lessons[selectedIndex].animationAsset,
//                       frameBuilder: (ctx, dotlottie) {
//                     if (dotlottie != null) {
//                       return Lottie.memory(dotlottie.animations.values.single);
//                     } else {
//                       return Container();
//                     }
//                   }),
//                 ),
//               );
//             },
//           ),
//         );
      }),
    );
  }
}

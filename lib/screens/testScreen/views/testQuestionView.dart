import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/testController.dart';

class TestQuestionView extends StatelessWidget {
  final TestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var lesson = controller.testCurrentSession.value!;
        final selected = controller.selectedIndex.value;
        return Column(
          children: [
            // Options grid (4 options)
            Expanded(
              flex: 5,
                child: DotLottieLoader.fromAsset("lib/resources/assets/Others/animations/confused.lottie",
                    frameBuilder: (ctx, dotlottie) {
                      if (dotlottie != null) {
                        return Lottie.memory(dotlottie.animations.values.single);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                ),
            ),
            Expanded(
              flex: 12,
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
                    bool isSelected = selected == optionIndex;
                    return GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = optionIndex;
                          controller.checkAnswer();
                          // Future.delayed(Duration(milliseconds: 500), () {
                          //   controller.selectedIndex.value = -1;
                          // });
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
                                  return const Center(child: CircularProgressIndicator());
                                }
                              }
                              ),
                        )
                    );
                  },
                ),
              ),
            ),

            // Check button
            Expanded(
              flex: 3 ,// Small section
              child: Center(
                child: Text(
                  lesson.lessons[controller.correctIndex].lessonName,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:blossoms_kids/screens/sessionScreen/views/sessionView.dart';
import 'package:blossoms_kids/screens/testScreen/controllers/testController.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../resources/routes/routesName.dart';
import '../../base/controllers/baseController.dart';


class TestLearningView extends StatelessWidget {
  TestLearningView({super.key});
  final TestController controller = Get.find();
  final BaseController baseController = Get.find();

  final String category = Get.arguments['category'];
  // final int sessionLevel = Get.arguments['sessionLevel'];
  final testCurrentSession = Get.arguments['testCurrentSession'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx( () {
        int sessionLevel = controller.testCurrentSessionLevel[category] as int;
        int testCurrentLessonIndex = controller.testCurrentLessonIndex.value;
        var lesson = testCurrentSession.value!.lessons[testCurrentLessonIndex];


        return SafeArea(
          child: Column(
            children: [
              // Back button and Session Level
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, size: 30),
                      onPressed: () {
                        // Navigator.pop(context);
                        // Get.offNamed(baseController.selectedIndex.value = 1;);
                        baseController.selectedIndex.value = 0;
                        Get.offNamed(RoutesName.baseView);// go to learn page
                      },
                    ),
                    SizedBox(width: 8), // Space between the icon and text
                    Text(
                      'Session: $sessionLevel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Main Content divided into 3 sections
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      // 1️⃣ First Column (Biggest) - Image/Animation
                      Expanded(
                        flex: 16, // Takes most of the space
                        child: DotLottieLoader.fromAsset(lesson.animationAsset,
                            frameBuilder: (ctx, dotlottie) {
                              if (dotlottie != null) {
                                return Lottie.memory(dotlottie.animations.values.single);
                              } else {
                                return Container();
                              }
                            }),
                        // child: Center(
                        //   child: Image.asset(lesson!.imageAsset),
                        // )
                      ),

                      // 2️⃣ Second Column - Text
                      Expanded(
                        flex: 5 ,// Small section
                        child: Center(
                          child: Text(
                            lesson.lessonName,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                        ),
                      ),

                      // 3️⃣ Third Column - Next Button
                      Expanded(
                        flex: 3, // Small section for button
                        // child: Container(color: Colors.red,),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40,right: 40,top: 16,bottom: 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: controller.goToNextLesson,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Next',
                                style: TextStyle(fontSize: 30, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

      }),
    );
  }
}

import 'dart:io';

import 'package:blossoms_kids/features/base/controllers/base_controller.dart';
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../core/resources/routes/routesName.dart';
import '../../assets/controllers/assets_controller.dart';
import '../controllers/session_controller.dart';

class SessionView extends StatelessWidget {
  SessionView({super.key});

  final SessionController controller = Get.find();
  final BaseController baseController = Get.find();
  final AssetController assetController = Get.find();

  final String category = Get.arguments['category'];

  // final int sessionLevel = Get.arguments['sessionLevel'];
  final currentSession = Get.arguments['currentSession'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color similar to border
      body: Obx(() {
        final assetsPath = assetController.assetsPath.value;
        int sessionLevel = controller.currentSessionLevel[category] as int;
        int currentLessonIndex = controller.currentLessonIndex.value;
        var lesson = currentSession.value!.lessons[currentLessonIndex];

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
                        baseController.selectedIndex.value = 1;
                        Get.offNamed(RoutesName.baseView); // go to learn page
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
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      // 1️⃣   First Column (Biggest) - Image/Animation
                      Expanded(
                        flex: 16, // Takes most of the space

                        child: GestureDetector(
                          onTap: () {
                            final path = assetsPath + lesson.soundAsset!;
                            print("Local sound path: $path");
                            controller.playSound(path);
                          },
                          child: DotLottieLoader.fromFile(
                              File(assetsPath + lesson.animationAsset),
                              frameBuilder: (ctx, dotlottie) {
                            final path = assetsPath + lesson.audioAsset!;
                            controller.playAudio(path);

                            if (dotlottie != null) {
                              return Lottie.memory(
                                  dotlottie.animations.values.single);
                            } else {
                              return Container();
                            }
                          }),
                        ),
                        // child: Center(
                        //   child: Image.asset(lesson!.imageAsset),
                        // )
                      ),

                      // 2️⃣ Second Column - Text
                      Expanded(
                        flex: 5, // Small section
                        child: Center(
                          child: Text(
                            lesson.lessonName
                                .toString()
                                .tr, // Will Show in different language
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 40, top: 10, bottom: 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      final path =
                                          assetsPath + lesson.audioAsset!;
                                      controller.playAudio(path);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: CircleBorder(),
                                      padding: const EdgeInsets.all(14),
                                    ),
                                    child: Icon(Icons.volume_up,
                                        size: 30, color: Colors.white)),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: controller.goToNextLesson,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      // minimumSize: Size(double.infinity, 60),
                                      // maximumSize: Size(300, 60),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                    ),
                                    child: Text(
                                      'Next'.tr,
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
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

import 'package:blossoms_kids/screens/testScreen/views/testLearningView.dart';
import 'package:blossoms_kids/screens/testScreen/views/testQuestionView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/testController.dart';
import '../controllers/testController2.dart';
import '../widgets/bottomButton.dart';
import 'lessonScreenView.dart';


class TestScreen extends StatelessWidget {
  final TestController controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 21, child: Obx(() => controller.showLesson.value ? TestLearningView() : TestQuestionView())),
          Expanded(flex: 3, child: BottomButton())
        ],
      ),
    );
  }
}
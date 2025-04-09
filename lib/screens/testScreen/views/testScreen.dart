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
          Expanded(flex: 5, child: Obx(() => controller.showLesson.value ? LessonView() : TestQuestionView())),
          Expanded(flex: 1, child: Obx(() => BottomButton()))
        ],
      ),
    );
  }
}
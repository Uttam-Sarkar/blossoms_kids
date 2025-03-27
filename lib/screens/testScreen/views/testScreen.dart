import 'package:blossoms_kids/screens/testScreen/views/testScreenView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/testController2.dart';
import '../widgets/bottomButton.dart';
import 'lessonScreenView.dart';


class TestScreen extends StatelessWidget {
  final TestController2 controller = Get.put(TestController2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 5, child: Obx(() => controller.showLesson.value ? LessonView() : TestScreenView())),
          Expanded(flex: 1, child: Obx(() => BottomButton()))
        ],
      ),
    );
  }
}
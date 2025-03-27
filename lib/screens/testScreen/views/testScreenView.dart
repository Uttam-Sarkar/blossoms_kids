import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/testController2.dart';

class TestScreenView extends StatelessWidget {
  final TestController2 controller = Get.find();
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var lesson = controller.testLessons[controller.currentLesson.value];
      int randomNum = random.nextInt(2);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: () => controller.checkAnswer(randomNum == 1 ? 0 : 1 ),
                child: Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(20),
                  child: randomNum == 1 ? Image.asset("assets/${lesson.correctAnimation}", height: 100) : Image.asset("assets/${lesson.correctAnimation}", height: 100),
                ),
              ),
              GestureDetector(
                onTap: () => controller.checkAnswer(randomNum == 1 ? 1 : 0),
                child: Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(20),
                  child: randomNum == 1 ? Image.asset("assets/${lesson.falseAnimation}", height: 100) : Image.asset("assets/${lesson.correctAnimation}", height: 100),
                ),
              )
            ],
          ),
          Text(lesson.text, style: TextStyle(fontSize: 24))
        ],
      );
    });
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/testController.dart';
import '../controllers/testController2.dart';

class BottomButton extends StatelessWidget {
  final TestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
      onPressed:  controller.goToNextLesson,
      child: Text(controller.showLesson.value ? "Next" : "Check"),
    ));
  }
}

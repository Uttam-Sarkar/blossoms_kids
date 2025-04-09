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
body: Obx(()
{
var lesson = controller.testCurrentSession.value!;

return Padding(
padding: const EdgeInsets.all(12.0),
child: GridView.builder(
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2, // Two images in each row
mainAxisSpacing: 10,
crossAxisSpacing: 10,
),
itemCount: 4,
itemBuilder: (context, index) {
// ImageModel image = controller.options[index];
int selectedIndex = controller.options[index];

return GestureDetector(
onTap: () => controller.checkAnswer(selectedIndex),
child: Container(
padding: const EdgeInsets.all(10),
decoration: BoxDecoration(
border: Border.all(color: Colors.black),
borderRadius: BorderRadius.circular(10),
),

child: DotLottieLoader.fromAsset(lesson.lessons[selectedIndex].animationAsset,
frameBuilder: (ctx, dotlottie) {
if (dotlottie != null) {
return Lottie.memory(dotlottie.animations.values.single);
} else {
return Container();
}
}),              ),
);
},
),
);
}
),
);
}
}
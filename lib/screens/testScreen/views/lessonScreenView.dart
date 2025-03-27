import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("A", style: TextStyle(fontSize: 50, color: Colors.green)),
        Image.asset("lib/resources/assets/Study/images/dj.jpg", height: 200),
        Text("Apple", style: TextStyle(fontSize: 24))
      ],
    );
  }
}
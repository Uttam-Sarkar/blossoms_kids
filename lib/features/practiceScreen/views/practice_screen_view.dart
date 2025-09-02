import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/colors/app_color.dart';
import '../../../core/resources/routes/routesName.dart';
import '../../assets/controllers/assets_controller.dart';
import '../../testScreen/controllers/test_controller.dart';
import '../widgets/learn_card.dart';

class PracticeScreenView extends StatelessWidget {
  PracticeScreenView({super.key});

  final TestController controller = Get.put(TestController());
  final AssetController assetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final assetsPath = assetController.assetsPath.value;

        // If assetsPath is not ready yet, show a loader
        if (assetsPath.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final List<Map<String, dynamic>> learnItems = [
          {
            "category": "Shape Matching",
            "image": "$assetsPath/assets/Others/images/shape.jpg",
            "color": AppColor.cardGreenColor,
            "route": RoutesName.shapeMatching
          },
          {
            "category": "Balloon Blast",
            "image": "$assetsPath/assets/Others/images/balloonBlast.jpg",
            "color": AppColor.cardOrangeColor,
            "route": RoutesName.balloonBlast
          },
          {
            "category": "Living Skill",
            "image": "$assetsPath/assets/Others/images/living.jpg",
            "color": AppColor.cardRedColor,
            "route": RoutesName.livingSkill
          },
          {
            "category": "Family",
            "image": "$assetsPath/assets/Others/images/family.jpg",
            "color": AppColor.cardPurpleColor,
            "route": RoutesName.family
          },
          {
            "category": "Study",
            "image": "$assetsPath/assets/Others/images/study.jpg",
            "color": AppColor.cardYellowColor,
            "route": RoutesName.study
          },
          {
            "category": "Emotion",
            "image": "$assetsPath/assets/Others/images/emotion.jpg",
            "color": AppColor.cardGreenColor,
            "route": RoutesName.emotion
          },
          {
            "category": "Profession",
            "image": "$assetsPath/assets/Others/images/profession.jpg",
            "color": AppColor.cardOrangeColor,
            "route": RoutesName.profession
          },
          {
            "category": "Music",
            "image": "$assetsPath/assets/Others/images/music.jpg",
            "color": AppColor.cardRedColor,
            "route": RoutesName.music
          },
          {
            "category": "Psychological",
            "image": "$assetsPath/assets/Others/images/psychological.jpg",
            "color": AppColor.cardPurpleColor,
            "route": RoutesName.psychologicalEducation
          },
          {
            "category": "Social Skill",
            "image": "$assetsPath/assets/Others/images/communication.jpg",
            "color": AppColor.cardYellowColor,
            "route": RoutesName.socialAndCommunicationSkill
          },
        ];

        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: learnItems.length,
          itemBuilder: (context, index) {
            final item = learnItems[index];
            return LearnCard(
              name: item['category'],
              image: File(item['image']),
              color: item['color'],
              onTap: () => controller.testStartSession(item['category']),
            );
          },
        );
      }),
    );
  }
}
// /data/data/com.example.blossoms_kids/app_flutter/blossom_assets/assets/Study/animations/a.lottie
// "/data/user/0/com.example.blossoms_kids/app_flutter/blossom_assets/assets/Study/animations/a.lottie

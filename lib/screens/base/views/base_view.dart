import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blossoms_kids/resources/colors/app_color.dart';
import 'package:blossoms_kids/screens/learnScreen/views/learnScreenView.dart';
import 'package:blossoms_kids/screens/navigation/curvedNavBar.dart';
import 'package:blossoms_kids/screens/parentScreen/views/parentScreenView.dart';
import 'package:blossoms_kids/screens/practiceScreen/views/practiceScreenView.dart';

import '../../end_drawer/views/appDrawer.dart';
import '../view_model/base_view_model.dart';


class BaseView extends StatelessWidget {
  // HomeView({super.key});
  BaseView({super.key});
  final BaseViewModel controller = Get.put(BaseViewModel());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> pages = [
    const PracticeScreenView(),
    LearnScreenView(),
    const ParentScreenView(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: const Text("Blossoms Kids",style: TextStyle(color: AppColor.primaryTextColor),),

          leading: Container(),
          actions: [
            IconButton(
              color: AppColor.primaryTextColor,
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ],
        elevation: 5,
        shadowColor: AppColor.appBarColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
        ),
      ),
      endDrawer: const AppDrawer(),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: CurvedNavBar(controller: controller),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blossoms_kids/features/learnScreen/views/learn_screen_view.dart';


import '../../../core/resources/colors/app_color.dart';
import '../../end_drawer/views/app_drawer.dart';
import '../../navigation/curved_nav_bar.dart';
import '../../parentScreen/views/parent_screen_view.dart';
import '../../practiceScreen/views/practice_screen_view.dart';
import '../controllers/base_controller.dart';


class BaseView extends StatelessWidget {
  BaseView({super.key});
  final BaseController controller = Get.put(BaseController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> pages = [
    PracticeScreenView(),
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
      endDrawer: AppDrawer(),
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: CurvedNavBar(controller: controller),
    );
  }
}

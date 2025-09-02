import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  final AuthController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Settings", style: TextStyle(color: Colors.white)),
          ),
          const ListTile(title: Text("Option 1")),
          ListTile(
              title: TextButton(onPressed: () {
                controller.logout();
              }, child: Text("Sign Out"))),
        ],
      ),
    );
  }
}

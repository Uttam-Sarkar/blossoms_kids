import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  late Box box;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void loadTheme() async {
    box = Hive.box('settings');
    isDarkMode.value = box.get('isDarkMode', defaultValue: false);
    _updateTheme(isDarkMode.value);
  }

  void toggleTheme(bool dark) {
    isDarkMode.value = dark;
    box.put('isDarkMode', dark);
    _updateTheme(dark);
  }

  void _updateTheme(bool dark) {
    Get.changeThemeMode(dark ? ThemeMode.dark : ThemeMode.light);
  }
}

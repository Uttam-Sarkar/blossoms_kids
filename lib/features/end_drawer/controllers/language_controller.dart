import 'dart:ui';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'English'.obs;
  final List<String> languages = ['English', 'Bangla', 'Hindi', 'German'];
  late Box box;

  @override
  void onInit() {
    super.onInit();
    loadLanguage();
  }

  void loadLanguage() async {
    box = Hive.box('settings');
    selectedLanguage.value = box.get('language', defaultValue: 'English');
    language(selectedLanguage.value);
  }

  void saveLanguage(String lang) async {
    await box.put('language', lang);
    selectedLanguage.value = lang;
    Get.updateLocale(language(lang));
  }

  Locale language(String lang) {
    if (lang == "Bangla") {
      return Locale('bn', 'BD');
    } else {
      return Locale('en', 'US');
    }
  }
}

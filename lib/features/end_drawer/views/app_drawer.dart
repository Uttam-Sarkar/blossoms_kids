import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/controllers/auth_controller.dart';
import '../controllers/language_controller.dart';
import '../controllers/theme_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final AuthController authController = Get.find();
  final LanguageController langController = Get.put(LanguageController());
  final ThemeController themeController = Get.put(ThemeController());

  void _showLanguagePopup(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Select Language'),
        content: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: langController.languages.map((lang) {
                return RadioListTile<String>(
                  title: Text(lang),
                  value: lang,
                  groupValue: langController.selectedLanguage.value,
                  onChanged: (value) {
                    if (value != null) {
                      langController.saveLanguage(value);
                      Get.back();
                      Get.snackbar('Language Changed', 'Selected: $value',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                );
              }).toList(),
            )),
      ),
    );
  }

  /// 🔹 Theme selection popup
  void _showThemePopup(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Select Theme'),
        content: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<bool>(
                  title: const Text('Light'),
                  value: false,
                  groupValue: themeController.isDarkMode.value,
                  onChanged: (val) {
                    themeController.toggleTheme(false);
                    Get.back();
                    Get.snackbar('Theme Changed', 'Light Mode Activated',
                        snackPosition: SnackPosition.BOTTOM);
                  },
                ),
                RadioListTile<bool>(
                  title: const Text('Dark'),
                  value: true,
                  groupValue: themeController.isDarkMode.value,
                  onChanged: (val) {
                    themeController.toggleTheme(true);
                    Get.back();
                    Get.snackbar('Theme Changed', 'Dark Mode Activated',
                        snackPosition: SnackPosition.BOTTOM);
                  },
                ),
              ],
            )),
      ),
    );
  }

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

          Obx(
            () => ListTile(
              title: Text("Language".tr),
              subtitle: Text(langController.selectedLanguage.value.tr),
              onTap: () => _showLanguagePopup(context),
            ),
          ),

          // Theme Option
          Obx(
            () => ListTile(
              // leading: const Icon(Icons.brightness_6),
              title: const Text("Theme"),
              subtitle: themeController.isDarkMode.value
                  ? Text("Dark")
                  : Text("Light"),
              onTap: () => _showThemePopup(context),
            ),
          ),

          ListTile(
            title: TextButton(
              onPressed: authController.logout,
              child: const Text("Sign Out"),
            ),
          ),
        ],
      ),
    );
  }
}

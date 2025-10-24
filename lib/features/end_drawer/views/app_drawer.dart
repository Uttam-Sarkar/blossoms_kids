import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/controllers/auth_controller.dart';
import '../controllers/language_controller.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final AuthController authController = Get.find();
  final LanguageController langController = Get.put(LanguageController());

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
          Obx(() => ListTile(
                title: Text("Language".tr),
                subtitle: Text(langController.selectedLanguage.value.tr),
                onTap: () => _showLanguagePopup(context),
              )),
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

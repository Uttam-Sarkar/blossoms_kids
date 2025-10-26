import 'package:blossoms_kids/features/auth/views/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/resources/getx_localization/languages.dart';
import 'core/resources/routes/routes.dart';
import 'features/assets/controllers/assets_controller.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/base/views/base_view.dart';
import 'features/end_drawer/controllers/language_controller.dart';
import 'features/end_drawer/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase
      .initializeApp(); // Ensure Firebase is initialized before running the app

  // ✅ Initialize Hive before runApp()
  await Hive.initFlutter();
  await Hive.openBox('settings'); // for language, theme, etc.

  final assetController = Get.put(AssetController());
  await assetController.initAssets();
  Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final LanguageController langController = Get.put(LanguageController());
    final ThemeController themeController = Get.put(ThemeController());

    // final AssetController assetController = Get.put(AssetController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // title: AppStrings.appName,
      // theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Flutter Demo',
      translations: Languages(),
      locale: langController.language(langController.selectedLanguage.value),
      fallbackLocale: Locale('en', 'US'),
      // if locale language is not supported for the device
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: AppColor.appBarColor),
      //   useMaterial3: true,
      // ),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
          themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,

      getPages: AppRoutes.appRoutes(),
      // home: TestScreen(),
      home: Obx(() {
        // load data
        // assetController.initAssets();
        if (authController.user.value != null) {
          return BaseView(); // already signed in
        } else {
          return SignInScreen(); // not signed in
        }
      }),
    );
  }
}

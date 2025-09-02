import 'package:blossoms_kids/features/auth/views/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/resources/colors/app_color.dart';
import 'core/resources/getx_localization/languages.dart';
import 'core/resources/routes/routes.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/base/views/base_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Firebase is initialized before running the app
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthController authController = Get.find();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // title: AppStrings.appName,
      // theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      // if locale language is not supported for the device
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.appBarColor),
        useMaterial3: true,
      ),

      getPages: AppRoutes.appRoutes(),
      // home: TestScreen(),
      home: Obx(() {
        if (authController.user.value != null) {
          return BaseView(); // already signed in
        } else {
          return SignInScreen(); // not signed in
        }
      }),
    );
  }
}

import 'package:blossoms_kids/screens/base/views/base_view.dart';
import 'package:blossoms_kids/screens/learnScreen/views/learnScreenView.dart';
import 'package:blossoms_kids/screens/sessionScreen/views/sessionCompletionView.dart';
import 'package:blossoms_kids/screens/sessionScreen/views/session_page.dart';
import 'package:blossoms_kids/screens/sessionScreen/views/sessionView.dart';
import 'package:blossoms_kids/screens/test/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:blossoms_kids/resources/colors/app_color.dart';
import 'package:blossoms_kids/resources/getx_localization/languages.dart';
import 'package:blossoms_kids/resources/routes/routes.dart';
// import 'package:voice_bridge/features/authentication/view_models/auth_view_model.dart';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // Ensure Firebase is initialized before running the app
  // Get.put(AuthViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // title: AppStrings.appName,
      // theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('en' , 'US'),
      fallbackLocale: Locale('en' , 'US'),// if locale language is not supported for the device
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.appBarColor),
        useMaterial3: true,
      ),

      getPages: AppRoutes.appRoutes(),
      // home: SessionCompletionView(),
    );
  }
}

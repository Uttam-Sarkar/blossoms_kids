// lib/features/auth/view/sign_up_screen.dart
import 'package:blossoms_kids/features/auth/views/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/text_input_field_widen.dart';
import '../controllers/auth_controller.dart';
// import '../model/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController controller = Get.find();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height * .8, // full screen height

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  KTextInputFieldWiden(
                      title: "Name", required: true, controller: nameC),
                  SizedBox(height: 10),
                  KTextInputFieldWiden(
                      title: "Email", required: true, controller: emailC),
                  SizedBox(height: 10),
                  KTextInputFieldWiden(
                      title: "Password", required: true, controller: passC),
                  SizedBox(height: 20),
                  Obx(() => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.signup(
                                nameC.text, emailC.text, passC.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            fixedSize: Size(300, 50),
                          ),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(SignInScreen()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

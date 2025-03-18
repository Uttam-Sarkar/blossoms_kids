import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/session_controller.dart';

class SessionPage extends StatelessWidget {
  // final SessionController controller = Get.find();
  final SessionController controller = Get.put(SessionController());
  final String category = Get.arguments['category'];
  final int session = Get.arguments['session'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category - Session $session")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Session $session", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.saveSession(category, session + 1); // Move to next session
                Get.back(); // Return to category screen
              },
              child: Text("Complete & Next"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/routes/routes_name.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class SessionController extends GetxController {
  var currentSessions = <String, int>{}.obs;  // Store session progress for each category
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId = "user_id"; // Replace with actual user ID from FirebaseAuth

  @override
  void onInit() {
    super.onInit();
    loadSessions(); // Load session data when the app starts
  }

  /// Load session progress from SharedPreferences
  Future<void> loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> categories = ["Study", "Social Skills", "Emotion"]; // Add all categories

    for (var category in categories) {
      int session = prefs.getInt('session_$category') ?? 1; // Default session is 1
      currentSessions[category] = session;
    }

    // await fetchSessionsFromFirebase(); // Fetch session progress from Firebase
  }

  /// Save session progress locally
  Future<void> saveSession(String category, int sessionNumber) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('session_$category', sessionNumber);
    currentSessions[category] = sessionNumber;

    // if (sessionNumber % 5 == 0) {
    //   updateSessionInFirebase(category, sessionNumber); // Sync every 5 sessions
    // }
  }

  /// Fetch session progress from Firebase when logging in on a new device
  // Future<void> fetchSessionsFromFirebase() async {
  //   var doc = await _firestore.collection('userProgress').doc(userId).get();
  //
  //   if (doc.exists) {
  //     Map<String, dynamic> data = doc.data()!;
  //     data.forEach((category, session) {
  //       currentSessions[category] = session; // Update local session values
  //     });
  //
  //     // Save fetched sessions to SharedPreferences
  //     final prefs = await SharedPreferences.getInstance();
  //     data.forEach((category, session) {
  //       prefs.setInt('session_$category', session);
  //     });
  //   }
  // }

  /// Update Firebase with the latest session progress
  // Future<void> updateSessionInFirebase(String category, int sessionNumber) async {
  //   await _firestore.collection('userProgress').doc(userId).set(
  //     {category: sessionNumber}, SetOptions(merge: true),
  //   );
  // }

  /// Start the session for the selected category
  void startSession(String category) {
    int session = currentSessions[category] ?? 1;
    Get.toNamed(RoutesName.sessionPage, arguments: {'category': category, 'session': session});
  }
  var currentLessonIndex = 0.obs;

  // Move to next lesson in the session
  void goToNextLesson() {
    if (currentSessions.value != null && currentLessonIndex.value < currentSessions.value!.length - 1) {
      currentLessonIndex.value++;
    }
  }

  // Move to previous lesson in the session
  void goToPreviousLesson() {
    if (currentLessonIndex.value > 0) {
      currentLessonIndex.value--;
    }
  }
}

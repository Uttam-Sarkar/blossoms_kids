// lib/features/auth/data/repositories/auth_repository.dart
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Signup
  Future<UserModel> signup(String name, String email, String password) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel(
      uid: cred.user!.uid,
      name: name,
      email: email,
    );
  }

  // Signin
  Future<UserModel> signin(String email, String password) async {
    UserCredential cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel(
      uid: cred.user!.uid,
      name: cred.user!.displayName ?? "",
      email: cred.user!.email ?? "",
    );
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Current user stream
  Stream<User?> get currentUser => _auth.authStateChanges();
}

// lib/features/auth/model/auth_controller.dart
import 'package:blossoms_kids/features/auth/views/sign_in_screen.dart';
import 'package:blossoms_kids/features/base/views/base_view.dart';
import 'package:get/get.dart';
import '../data/models/user_model.dart';

// import '../data/repositories/auth_repository.dart';
import '../data/repository/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _repository = AuthRepository();

  var isLoading = false.obs;
  Rxn<UserModel> user = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();

    // Listen to auth state
    _repository.currentUser.listen((firebaseUser) {
      if (firebaseUser != null) {
        user.value = UserModel(
          uid: firebaseUser.uid,
          name: firebaseUser.displayName ?? "",
          email: firebaseUser.email ?? "",
        );
      } else {
        user.value = null;
      }
    });
  }

  Future<void> signup(String name, String email, String password) async {
    try {
      isLoading.value = true;
      user.value = await _repository.signup(name, email, password);
      Get.snackbar("Success", "Account created!");
      Get.to(SignInScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signin(String email, String password) async {
    try {
      isLoading.value = true;
      user.value = await _repository.signin(email, password);
      Get.snackbar("Success", "Welcome back!");
      Get.to(BaseView());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _repository.logout();
  }
}

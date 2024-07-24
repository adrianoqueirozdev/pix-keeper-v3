import 'dart:async';
import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/usecases/sign_in_with_google.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class LoginPageController extends GetxController {
  final SignInWithGoogle _signInWithGoogle;

  LoginPageController(this._signInWithGoogle);

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> login() async {
    _isLoading.value = true;
    update();

    try {
      final credential = await _signInWithGoogle();
      if (credential.user != null) {
        Get.offNamed(AppRoutes.home);
      }
    } catch (e) {
      _isLoading.value = false;
      rethrow;
    } finally {
      _isLoading.value = false;
    }
  }
}

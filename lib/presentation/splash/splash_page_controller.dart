import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    final currentUser = FirebaseAuth.instance.currentUser;

    Future.delayed(const Duration(seconds: 3), () {
      if (currentUser != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offNamed(AppRoutes.login);
      }
    });

    super.onInit();
  }
}

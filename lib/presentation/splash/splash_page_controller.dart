import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/usecases/check_authentication_status.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class SplashPageController extends GetxController {
  final CheckAuthenticationStatus _checkAuthenticationStatus;

  SplashPageController(this._checkAuthenticationStatus);

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      final isLoggedIn = _checkAuthenticationStatus.call();

      if (isLoggedIn) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offNamed(AppRoutes.login);
      }
    });

    super.onInit();
  }
}

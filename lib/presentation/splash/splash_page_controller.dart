import 'package:get/get.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.home);
    });

    super.onInit();
  }
}

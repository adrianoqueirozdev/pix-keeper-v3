import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/usecases/logout_user.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class ProfilePageController extends GetxController {
  final LogoutUser _logoutUser;

  ProfilePageController(this._logoutUser);

  void onOpenAppSettings() async {
    await AppSettings.openAppSettings();
  }

  void onNavigateToTrashCan() {
    Get.toNamed(AppRoutes.trashCan);
  }

  void onLogout() async {
    await _logoutUser.call().then((_) => Get.offAllNamed(AppRoutes.login));
  }
}

import 'package:app_settings/app_settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class ProfilePageController extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;

  void onOpenAppSettings() async {
    await AppSettings.openAppSettings();
  }

  void onNavigateToTrashCan() {
    final pixKeyBloc = Get.arguments as PixKeyBloc;
    Get.toNamed(AppRoutes.trashCan, arguments: pixKeyBloc);
  }
}

import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/copy_pix_key.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PixKeyDetailsController extends GetxController {
  final _pixKeyDetails = PixKeyModel().obs;

  late final CopyController copyController;
  late final CopyPixKey copyPixKey;

  PixKeyModel get pixKeyDetails => _pixKeyDetails.value;

  void copyAndOpenAppBank(String packageName) async {
    copyController.copyText(pixKeyDetails);

    final bool isInstalled = await DeviceApps.isAppInstalled(packageName);

    if (isInstalled) {
      await DeviceApps.openApp(packageName);
    } else {
      await launchUrl(
        Uri.parse("https://play.google.com/store/apps/details?id=$packageName"),
        mode: LaunchMode.externalNonBrowserApplication,
      );
    }
  }

  void onEdit() {
    Get.toNamed(AppRoutes.pixKeyForm, arguments: pixKeyDetails)?.then((onValue) {
      if (onValue != null) {
        _pixKeyDetails.value = onValue as PixKeyModel;
        update();
      }
    });
  }

  @override
  void onInit() {
    copyController = CopyController();
    copyPixKey = CopyPixKey(repository: PixKeysRepositoryImpl());

    final arguments = Get.arguments as PixKeyModel;

    _pixKeyDetails.value = arguments;
    super.onInit();
  }
}

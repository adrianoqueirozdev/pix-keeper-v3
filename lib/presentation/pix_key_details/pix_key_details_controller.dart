import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PixKeyDetailsController extends GetxController {
  final _pixKeyDetails = PixKeyModel().obs;

  late final CopyController copyController;

  PixKeyModel get pixKeyDetails => _pixKeyDetails.value;

  void copyAndOpenAppBank(String packageName) async {
    copyController.copyText(pixKeyDetails.key!);

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

  @override
  void onInit() {
    copyController = CopyController();
    final arguments = Get.arguments as PixKeyModel;

    _pixKeyDetails.value = arguments;
    super.onInit();
  }
}

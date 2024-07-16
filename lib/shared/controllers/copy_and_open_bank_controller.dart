import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class CopyAndOpenBankController extends GetxController {
  void copyAndOpenAppBank(String packageName, PixKeyModel pixKey) async {
    final copyController = Get.put(CopyController());

    await copyController.copyText(pixKey);

    if (await DeviceApps.isAppInstalled(packageName)) {
      await DeviceApps.openApp(packageName);
      return;
    }

    await launchUrl(
      Uri.parse("https://play.google.com/store/apps/details?id=$packageName"),
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
}

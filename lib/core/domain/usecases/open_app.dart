import 'package:device_apps/device_apps.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenApp {
  Future<void> call(String packageName) async {
    if (await DeviceApps.isAppInstalled(packageName)) {
      await DeviceApps.openApp(packageName);
    } else {
      await launchUrl(
        Uri.parse("https://play.google.com/store/apps/details?id=$packageName"),
        mode: LaunchMode.externalNonBrowserApplication,
      );
    }
  }
}

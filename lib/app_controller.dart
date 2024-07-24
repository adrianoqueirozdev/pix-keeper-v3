import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_application/secure_application.dart';

class AppController extends GetxController with WidgetsBindingObserver {
  late SecureApplicationController secureApplicationController;

  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    _initializeSecureController();
    _setBrightness();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      secureApplicationController.unlock();
    }
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _setBrightness();
  }

  void _setBrightness() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    _isDarkMode.value = brightness == Brightness.dark;
    update();
  }

  void _initializeSecureController() {
    secureApplicationController = SecureApplicationController(SecureApplicationState());
    Future.microtask(() => secureApplicationController.secure());
  }
}

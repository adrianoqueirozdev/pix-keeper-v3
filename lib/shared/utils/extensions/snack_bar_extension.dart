import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SnackbarExtension on GetInterface {
  void showCustomSnackbar({
    required String message,
    Duration duration = const Duration(milliseconds: 3000),
    Duration animationDuration = const Duration(milliseconds: 200),
    Widget? mainButton,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        duration: duration,
        animationDuration: animationDuration,
        mainButton: mainButton,
        message: message,
      ),
    );
  }
}

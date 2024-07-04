import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/splash/splash_page_controller.dart';
import 'package:pix_keeper/presentation/splash/widgets/app_logo.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = colorScheme.brightness == Brightness.dark;

    return GetBuilder<SplashPageController>(
      init: SplashPageController(),
      builder: (_) {
        return Scaffold(
          backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 0,
          ),
          body: Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const AppLogo().animate().slide(),
            ),
          ),
        );
      },
    );
  }
}

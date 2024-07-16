import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/splash/splash_page_controller.dart';
import 'package:pix_keeper/shared/constants/animations.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              child: SvgPicture.asset(
                AppImages.logoDefault,
                width: size.width * 0.5,
                height: 120,
              ).animate().fade(duration: kDurationAnimation).fadeOut(
                    delay: 2100.ms,
                    duration: kDurationAnimation,
                  ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/login/login_page_controller.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = colorScheme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
          appBar: AppBar(
            backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
            foregroundColor: isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary,
            centerTitle: true,
            toolbarHeight: size.height * 0.4,
            title: SvgPicture.asset(
              AppImages.logoDefault,
              height: size.height * 0.2,
            ).animate().fade(),
          ),
          body: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Gerencie suas chaves Pix sem complexidade",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .slideY(
                        begin: -1,
                        end: 0,
                        duration: 300.ms,
                        delay: 300.ms,
                      )
                      .fade(delay: 400.ms),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: size.width * 0.8,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      ),
                      onPressed: controller.login,
                      label: const Text("Entrar com Google"),
                      icon: Image.asset(AppImages.iconGoogle, width: 28, height: 28),
                    ),
                  ).animate().shakeX(delay: 700.ms),
                ],
              ),
            ),
          ),
          bottomSheet: controller.isLoading
              ? const LinearProgressIndicator(
                  minHeight: 6,
                )
              : null,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/splash/splash_page_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashPageController>(
      init: SplashPageController(),
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Splash Page'),
          ),
        );
      },
    );
  }
}

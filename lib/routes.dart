import 'package:flutter/material.dart';
import 'package:pix_keeper/presentation/home/home_page.dart';
import 'package:pix_keeper/presentation/login/login_page.dart';
import 'package:pix_keeper/presentation/pix_key_details/pix_key_details_page.dart';
import 'package:pix_keeper/presentation/pix_key_form/pix_key_form_page.dart';
import 'package:pix_keeper/presentation/splash/splash_page.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

Map<String, Widget Function(BuildContext context)> getRoutes() {
  return {
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.pixKeyForm: (_) => const PixKeyFormPage(),
    AppRoutes.pixKeyDetails: (_) => const PixKeyDetailsPage(),
  };
}

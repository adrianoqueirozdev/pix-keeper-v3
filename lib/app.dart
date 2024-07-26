import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/app_controller.dart';
import 'package:pix_keeper/config/routes.dart';
import 'package:pix_keeper/core/presentation/theme/app_theme.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pix Keeper',
          theme: AppTheme.getTheme(context, controller.isDarkMode),
          initialRoute: AppRoutes.splash,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
          routes: getRoutes(),
        );
      },
    );
  }
}

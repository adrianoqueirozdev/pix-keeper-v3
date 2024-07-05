import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/app_controller.dart';
import 'package:pix_keeper/routes.dart';
import 'package:pix_keeper/shared/constants/app_fonts.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:animations/animations.dart';

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
        final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: controller.brightness,
        );

        final isDark = colorScheme.brightness == Brightness.dark;
        final TextTheme textTheme = Theme.of(context).textTheme;

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: colorScheme,
            useMaterial3: true,
            fontFamily: AppFontes.lexendDeca,
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0,
              backgroundColor: isDark ? colorScheme.onSecondary : colorScheme.primary,
              foregroundColor: isDark ? colorScheme.onSurface : colorScheme.onPrimary,
              titleTextStyle: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark ? colorScheme.onSurface : colorScheme.onPrimary,
              ),
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: colorScheme.surface,
              surfaceTintColor: colorScheme.surface,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: isDark ? colorScheme.primaryContainer : colorScheme.primary,
              foregroundColor: isDark ? colorScheme.onPrimaryContainer : colorScheme.onPrimary,
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.horizontal,
                ),
              },
            ),
          ),
          initialRoute: AppRoutes.splash,
          routes: getRoutes(),
        );
      },
    );
  }
}

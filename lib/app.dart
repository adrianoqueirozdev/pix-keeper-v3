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

        final isDarkMode = colorScheme.brightness == Brightness.dark;
        final TextTheme textTheme = Theme.of(context).textTheme;

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: colorScheme,
            useMaterial3: true,
            scaffoldBackgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
            textTheme: textTheme.apply(
              fontSizeFactor: 1.05,
              fontSizeDelta: 1.0,
              fontFamily: AppFontes.lexendDeca,
              bodyColor: colorScheme.onSurface,
            ),
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0,
              backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
              foregroundColor: isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary,
              titleTextStyle: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary,
              ),
            ),
            tooltipTheme: TooltipThemeData(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: colorScheme.onSurface,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: colorScheme.surface,
              surfaceTintColor: colorScheme.surface,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: isDarkMode ? colorScheme.primaryContainer : colorScheme.primary,
              foregroundColor: isDarkMode ? colorScheme.onPrimaryContainer : colorScheme.onPrimary,
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

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/constants/app_fonts.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context, bool isDarkMode) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );

    return ThemeData(
      colorScheme: colorScheme,
      fontFamily: AppFontes.lexendDeca,
      useMaterial3: true,
      textTheme: Theme.of(context).textTheme.apply(
            fontSizeFactor: 1.05,
            fontSizeDelta: 1.0,
            fontFamily: AppFontes.lexendDeca,
            bodyColor: colorScheme.onSurface,
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 0,
      ),
      tooltipTheme: TooltipThemeData(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: colorScheme.onSurface,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: isDarkMode ? colorScheme.primaryContainer : colorScheme.primary,
          foregroundColor: isDarkMode ? colorScheme.onPrimaryContainer : colorScheme.onPrimary,
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
    );
  }
}

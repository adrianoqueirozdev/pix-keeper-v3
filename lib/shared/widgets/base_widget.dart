import 'package:flutter/material.dart';

class BaseWidgetBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, TextTheme textTheme, ColorScheme colorScheme, bool isDarkMode, Size size)
      builder;

  const BaseWidgetBuilder({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = colorScheme.brightness == Brightness.dark;

    return builder(context, textTheme, colorScheme, isDarkMode, size);
  }
}

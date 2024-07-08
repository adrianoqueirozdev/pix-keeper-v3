import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Certifique-se de ter o pacote flutter_animate instalado

class TitleDetail extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? nameStyle;
  final Color? titleColor;
  final Duration animationDuration;
  final double spacing;

  const TitleDetail({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.nameStyle,
    this.titleColor,
    this.animationDuration = const Duration(milliseconds: 300),
    this.spacing = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: titleStyle ??
              textTheme.bodySmall?.copyWith(
                color: titleColor ?? colorScheme.secondary,
              ),
        ),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: nameStyle ?? textTheme.bodyMedium,
        ).animate().fadeIn(duration: animationDuration),
        SizedBox(
          height: spacing,
        ),
      ],
    );
  }
}

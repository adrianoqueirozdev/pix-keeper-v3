import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class TitleDetail extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? nameStyle;
  final Color? titleColor;
  final double spacing;

  const TitleDetail({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.nameStyle,
    this.titleColor,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (context, textTheme, colorScheme, _, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleStyle ??
                textTheme.bodyMedium?.copyWith(
                  color: titleColor ?? colorScheme.secondary,
                ),
          ),
          Tooltip(
            message: value,
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: nameStyle ?? textTheme.bodyLarge,
            ).animate().fadeIn(duration: 300.ms),
          ),
          SizedBox(
            height: spacing,
          ),
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/constants/environments.dart';

class AppLogo extends StatelessWidget {
  final bool animated;

  const AppLogo({super.key, this.animated = true});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;
    final color = isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary;

    return Stack(
      children: [
        Text(
          Environments.appName,
          style: textTheme.displaySmall?.copyWith(
            color: color,
          ),
        ),
        Positioned(
          right: 0,
          top: 4,
          child: Builder(
            builder: (context) {
              if (animated) {
                return SlideInRight(
                  duration: const Duration(milliseconds: 700),
                  child: _Dot(color: color),
                );
              }

              return _Dot(color: color);
            },
          ),
        ),
        Positioned(
          bottom: 0,
          child: Builder(
            builder: (context) {
              if (animated) {
                return SlideInLeft(
                  duration: const Duration(milliseconds: 700),
                  child: _Dot(color: color),
                );
              }

              return _Dot(color: color);
            },
          ),
        )
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}

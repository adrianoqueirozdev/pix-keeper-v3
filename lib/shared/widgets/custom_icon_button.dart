import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Size size;
  final double iconSize;
  final Color? colorIcon;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = const Size(28, 28),
    this.iconSize = 24,
    this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: iconSize,
          color: colorIcon,
        ),
      ),
    );
  }
}

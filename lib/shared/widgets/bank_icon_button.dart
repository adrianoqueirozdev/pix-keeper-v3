import 'package:flutter/material.dart';

class BankIconButton extends StatelessWidget {
  final String imagePath;
  final Function() onPressed;

  const BankIconButton({super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.secondaryContainer,
        ),
        onPressed: onPressed,
        icon: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            width: 32,
            height: 32,
          ),
        ),
      ),
    );
  }
}

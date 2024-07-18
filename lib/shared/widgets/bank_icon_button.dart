import 'package:flutter/material.dart';

class BankIconButton extends StatelessWidget {
  final String imagePath;
  final Function() onPressed;

  const BankIconButton({super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(4),
        backgroundColor: colorScheme.secondaryContainer,
      ),
      onPressed: onPressed,
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class BankIconButton extends StatelessWidget {
  final String imagePath;
  final Function() onPressed;

  const BankIconButton({super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (_, __, colorScheme, ___, ____) => IconButton(
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
      ),
    );
  }
}

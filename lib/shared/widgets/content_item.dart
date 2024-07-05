import 'package:pix_keeper/shared/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData iconData;
  final bool isCentered;

  const ContentItem({
    super.key,
    required this.text,
    required this.onPressed,
    required this.iconData,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Tooltip(
            message: text,
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(width: 4),
        CustomIconButton(
          size: const Size(24, 24),
          onPressed: onPressed,
          icon: iconData,
          iconSize: 18,
        ),
      ],
    );
  }
}

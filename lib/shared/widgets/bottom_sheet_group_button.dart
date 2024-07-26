import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class BottomSheetGroupButton extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback? onSecondaryAction;
  final VoidCallback? onPrimaryAction;

  const BottomSheetGroupButton({
    super.key,
    this.primaryText = "Confirmar",
    this.secondaryText = "Cancelar",
    this.onSecondaryAction,
    this.onPrimaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (_, __, ___, ____, size) {
        final widthButton = size.width * 0.5 - 24;

        return Row(
          children: [
            SizedBox(
              width: widthButton,
              height: 54,
              child: OutlinedButton(
                onPressed: onSecondaryAction,
                child: Text(secondaryText),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              width: widthButton,
              height: 54,
              child: FilledButton(
                onPressed: onPrimaryAction,
                child: Text(primaryText),
              ),
            ),
          ],
        );
      },
    );
  }
}

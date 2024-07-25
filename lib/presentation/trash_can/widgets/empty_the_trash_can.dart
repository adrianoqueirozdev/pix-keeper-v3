import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/modal_bottom_sheet_base.dart';

class EmptyTheTrashcan extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const EmptyTheTrashcan({super.key, required this.onCancel, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (context, textTheme, colorScheme, isDarkMode, size) {
        final widthButton = size.width * 0.5 - 24;

        return ModalBottomSheetBase(
          height: 244,
          title: "Esvaziar Lixeira",
          children: [
            Text(
              "Tem certeza que deseja esvaziar a lixeira? "
              "As chaves Pix serão excluídas e não será possível recuperá-las.",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                SizedBox(
                  width: widthButton,
                  height: 54,
                  child: OutlinedButton(
                    onPressed: onCancel,
                    child: const Text("Cancelar"),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: widthButton,
                  height: 54,
                  child: FilledButton(
                    onPressed: onConfirm,
                    child: const Text("Confirmar"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

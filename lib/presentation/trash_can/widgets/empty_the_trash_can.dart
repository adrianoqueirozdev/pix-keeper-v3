import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/bottom_sheet_group_button.dart';
import 'package:pix_keeper/shared/widgets/modal_bottom_sheet_base.dart';

class EmptyTheTrashcan extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const EmptyTheTrashcan({super.key, required this.onCancel, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (_, textTheme, __, ___, ____) {
        return ModalBottomSheetBase(
          height: 252,
          title: "Esvaziar Lixeira",
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    "Tem certeza que deseja esvaziar a lixeira? "
                    "As chaves Pix serão excluídas e não será possível recuperá-las.",
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  BottomSheetGroupButton(
                    onSecondaryAction: onCancel,
                    onPrimaryAction: onConfirm,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

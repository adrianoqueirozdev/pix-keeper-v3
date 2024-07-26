import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/bottom_sheet_group_button.dart';
import 'package:pix_keeper/shared/widgets/modal_bottom_sheet_base.dart';

class AddCopiedPixKey extends StatelessWidget {
  final String keyText;
  final String pixKeyTypeLabel;
  final VoidCallback onIgnored;
  final VoidCallback onAddPixKey;

  const AddCopiedPixKey({
    super.key,
    required this.keyText,
    required this.pixKeyTypeLabel,
    required this.onIgnored,
    required this.onAddPixKey,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (_, textTheme, colorScheme, __, ___) {
        return ModalBottomSheetBase(
          height: 349,
          title: "Chave Pix copiada",
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    "Identificamos que você copiou uma chave Pix",
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer.withAlpha(98),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        "Chave Pix",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            keyText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            pixKeyTypeLabel,
                            style: textTheme.labelLarge?.copyWith(
                              color: colorScheme.secondary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.pix_outlined),
                    ),
                  ),
                  const SizedBox(height: 32),
                  BottomSheetGroupButton(
                    primaryText: 'Adicionar',
                    secondaryText: 'Ignorar',
                    onPrimaryAction: onAddPixKey,
                    onSecondaryAction: onIgnored,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

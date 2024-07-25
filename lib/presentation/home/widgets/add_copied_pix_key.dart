import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
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
      builder: (context, textTheme, colorScheme, isDarkMode, size) {
        final widthButton = size.width * 0.5 - 24;

        return ModalBottomSheetBase(
          height: 356,
          title: "Chave Pix copiada",
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
            Row(
              children: [
                SizedBox(
                  width: widthButton,
                  height: 54,
                  child: OutlinedButton(
                    onPressed: onIgnored,
                    child: const Text("Ignorar"),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: widthButton,
                  height: 54,
                  child: FilledButton(
                    onPressed: onAddPixKey,
                    child: const Text("Adicionar"),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

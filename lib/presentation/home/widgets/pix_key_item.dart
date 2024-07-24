import 'package:flutter/material.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class PixKeyItem extends StatelessWidget {
  final PixKeyModel pixKey;
  final void Function(PixKeyModel pixKey) onNavigateToDetails;
  final void Function(PixKeyModel pixKey) onShowBottomSheetBanks;

  const PixKeyItem({
    super.key,
    required this.pixKey,
    required this.onNavigateToDetails,
    required this.onShowBottomSheetBanks,
  });

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (context, textTheme, colorScheme, _, __) {
        return GestureDetector(
          onTap: () => onNavigateToDetails(pixKey),
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 12, right: 8, bottom: 8),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withAlpha(98),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                pixKey.name!,
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
                    pixKey.key!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    pixKey.pixKeyTypeLabel!,
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.secondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () => onShowBottomSheetBanks(pixKey),
                icon: const Icon(Icons.account_balance),
              ),
            ),
          ),
        );
      },
    );
  }
}

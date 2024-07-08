import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';

class PixKeysList extends StatelessWidget {
  final List<PixKeyModel> pixKeys;
  final Future<void> Function() onRefresh;
  final void Function(PixKeyModel pixKey)? onCopy;

  const PixKeysList({
    super.key,
    required this.pixKeys,
    required this.onRefresh,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<CopyController>(
      init: CopyController(),
      builder: (copyController) {
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            itemCount: pixKeys.length,
            itemBuilder: (context, index) {
              final pixKey = pixKeys[index];

              return ListBody(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 2, left: 16, right: 12, bottom: 8),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer.withAlpha(98),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
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
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            pixKey.pixKeyTypeLabel!,
                            style: textTheme.labelLarge?.copyWith(
                              color: colorScheme.secondary,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          copyController.copyText(pixKey.key!);
                          onCopy?.call(pixKey);
                        },
                        icon: Icon(
                          copyController.icon(pixKey.key!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}

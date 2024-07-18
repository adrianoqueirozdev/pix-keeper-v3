import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';
import 'package:pix_keeper/shared/widgets/empty_state.dart';

class TrashCanPixKeysList extends StatelessWidget {
  final List<PixKeyModel> pixKeys;
  final Future<void> Function() onRefresh;
  final void Function(PixKeyModel pixKey) onRestore;

  const TrashCanPixKeysList({
    super.key,
    required this.pixKeys,
    required this.onRefresh,
    required this.onRestore,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (pixKeys.isEmpty) {
      return const Center(
        child: EmptyState(description: 'Lixeira vazia'),
      );
    }

    return GetBuilder<CopyController>(
      init: CopyController(),
      builder: (copyController) {
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: pixKeys.length,
            itemBuilder: (context, index) {
              final pixKey = pixKeys[index];

              return ListBody(
                children: [
                  GestureDetector(
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
                              style: Theme.of(context).textTheme.bodyMedium,
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
                            )
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () => onRestore(pixKey),
                          icon: const Icon(
                            Icons.restore_from_trash,
                          ),
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

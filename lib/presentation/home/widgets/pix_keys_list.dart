import 'package:flutter/material.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_key_item.dart';
import 'package:pix_keeper/shared/widgets/empty_state.dart';

class PixKeysList extends StatelessWidget {
  final List<PixKeyModel> pixKeys;
  final Future<void> Function() onRefresh;
  final void Function(PixKeyModel pixKey) onNavigateToDetails;
  final void Function(PixKeyModel pixKey) onShowBottomSheetBanks;

  const PixKeysList({
    super.key,
    required this.pixKeys,
    required this.onRefresh,
    required this.onNavigateToDetails,
    required this.onShowBottomSheetBanks,
  });

  @override
  Widget build(BuildContext context) {
    if (pixKeys.isEmpty) {
      return const Center(
        child: EmptyState(description: 'Nenhuma chave encontrada'),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: pixKeys.length,
        itemBuilder: (context, index) {
          final pixKey = pixKeys[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: PixKeyItem(
              pixKey: pixKey,
              onNavigateToDetails: onNavigateToDetails,
              onShowBottomSheetBanks: onShowBottomSheetBanks,
            ),
          );
        },
      ),
    );
  }
}

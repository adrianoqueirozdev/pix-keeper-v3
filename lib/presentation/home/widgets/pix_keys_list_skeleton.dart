import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/shimmer_item.dart';

class PixKeysListSkeleton extends StatelessWidget {
  const PixKeysListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ShimmerItem(
          height: 88,
        );
      },
    );
  }
}

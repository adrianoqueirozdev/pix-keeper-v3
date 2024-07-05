import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? baseColor;
  final Color? highlightColor;
  final double? borderRadius;
  final Widget? child;

  const ShimmerItem({
    super.key,
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Shimmer.fromColors(
        baseColor: colorScheme.secondaryContainer,
        highlightColor: colorScheme.secondaryContainer.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
          width: width ?? size.width,
          height: height ?? 30,
          child: child,
        ),
      ),
    );
  }
}

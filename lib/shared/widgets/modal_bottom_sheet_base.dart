import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class ModalBottomSheetBase extends StatelessWidget {
  final String title;
  final double? height;
  final List<Widget> children;
  final VoidCallback? onClose;

  const ModalBottomSheetBase({super.key, required this.children, required this.title, this.height, this.onClose});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(builder: (_, textTheme, __, ___, size) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: height ?? size.height * 0.96,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                IconButton(
                  onPressed: onClose ?? () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      );
    });
  }
}

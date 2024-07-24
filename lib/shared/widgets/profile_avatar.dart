import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class ProfileAvatar extends StatelessWidget {
  final double size;
  final String imageUrl;
  final Color? borderColor;

  const ProfileAvatar({super.key, required this.imageUrl, this.size = 40, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (context, _, colorScheme, isDarkMode, __) {
        return ClipOval(
          child: Container(
            color: borderColor ?? (isDarkMode ? colorScheme.onSurface : colorScheme.surface),
            width: size,
            height: size,
            padding: const EdgeInsets.all(2),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                progressIndicatorBuilder: (_, __, progress) {
                  return CircularProgressIndicator(value: progress.progress);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

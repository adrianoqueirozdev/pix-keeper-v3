import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pix_keeper/shared/constants/animations.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PixKeyQrCode extends StatelessWidget {
  final String text;

  const PixKeyQrCode({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = colorScheme.brightness == Brightness.dark;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.secondaryContainer,
            width: isDarkMode ? 0 : 1,
          ),
        ),
        child: QrImageView(
          data: text,
          version: QrVersions.auto,
          errorCorrectionLevel: QrErrorCorrectLevel.H,
          size: 180,
          embeddedImage: const AssetImage(
            AppImages.logoQr,
          ),
          embeddedImageStyle: const QrEmbeddedImageStyle(
            size: Size(40, 40),
          ),
        ),
      ),
    ).animate().fadeIn(duration: kDurationAnimation);
  }
}

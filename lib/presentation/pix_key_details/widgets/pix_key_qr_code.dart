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
        width: 180,
        height: 180,
        child: QrImageView(
          data: text,
          errorCorrectionLevel: QrErrorCorrectLevel.H,
          version: QrVersions.auto,
          eyeStyle: QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: isDarkMode ? colorScheme.surface : colorScheme.onSurface,
          ),
          embeddedImage: const AssetImage(
            AppImages.logoQr,
          ),
          embeddedImageStyle: const QrEmbeddedImageStyle(
            size: Size(40, 40),
          ),
          dataModuleStyle: QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: isDarkMode ? colorScheme.surface : colorScheme.onSurface,
          ),
        ).animate().fadeIn(duration: kDurationAnimation),
      ),
    );
  }
}

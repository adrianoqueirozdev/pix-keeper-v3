import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PixKeyQrCode extends StatelessWidget {
  final String text;

  const PixKeyQrCode({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (context, _, colorScheme, isDarkMode, __) => Center(
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
            version: QrVersions.auto,
          ),
        ),
      ),
    );
  }
}

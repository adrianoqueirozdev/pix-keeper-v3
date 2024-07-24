import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/shared/constants/app_constants.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';
import 'package:pix_keeper/shared/utils/bank_apps.dart';
import 'package:pix_keeper/shared/widgets/bank_icon_button.dart';

class BanksList extends StatelessWidget {
  final PixKeyModel pixKey;

  const BanksList({super.key, required this.pixKey});

  @override
  Widget build(BuildContext context) {
    final copyController = Get.find<CopyController>();

    return GetBuilder<CopyController>(
      init: copyController,
      builder: (controller) {
        return Center(
          child: SizedBox(
            width: bankApps.length * 64,
            height: 64,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bankApps.length,
              itemBuilder: (context, index) {
                final bankInfo = bankApps[index];

                return Container(
                  width: 64,
                  height: 64,
                  padding: const EdgeInsets.all(4),
                  child: BankIconButton(
                    imagePath: bankInfo.imagePath,
                    onPressed: () => controller.onCopyAndOpenAppBank(bankInfo.packageName, pixKey),
                  ),
                );
              },
            ),
          ),
        ).animate().fadeIn(duration: kDurationAnimation);
      },
    );
  }
}

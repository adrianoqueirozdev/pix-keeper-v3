import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/constants/animations.dart';
import 'package:pix_keeper/shared/controllers/copy_and_open_bank_controller.dart';
import 'package:pix_keeper/shared/utils/info_of_banks_apps.dart';
import 'package:pix_keeper/shared/widgets/bank_icon_button.dart';

class BanksList extends StatelessWidget {
  final PixKeyModel pixKey;

  const BanksList({super.key, required this.pixKey});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CopyAndOpenBankController>(
      init: CopyAndOpenBankController(),
      builder: (controller) {
        return Center(
          child: SizedBox(
            width: infoOfBanksApps.length * 72,
            height: 72,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: infoOfBanksApps.length,
              itemBuilder: (context, index) {
                final bankInfo = infoOfBanksApps[index];

                return Container(
                  width: 72,
                  height: 72,
                  padding: const EdgeInsets.all(4),
                  child: BankIconButton(
                    imagePath: bankInfo.imagePath,
                    onPressed: () => controller.copyAndOpenAppBank(bankInfo.packageName, pixKey),
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

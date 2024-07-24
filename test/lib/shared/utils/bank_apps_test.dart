import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/config/logger_config.dart';
import 'package:pix_keeper/core/data/models/info_bank_app_model.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';
import 'package:pix_keeper/shared/utils/bank_apps.dart';

void main() {
  test('should contain correct bank apps', () {
    final expectedBankApps = [
      InfoBankAppModel(
        imagePath: AppImages.caixa,
        packageName: 'br.com.gabba.Caixa',
      ),
      InfoBankAppModel(
        imagePath: AppImages.nubank,
        packageName: 'com.nu.production',
      ),
      InfoBankAppModel(
        imagePath: AppImages.itau,
        packageName: 'com.itau',
      ),
      InfoBankAppModel(
        imagePath: AppImages.inter,
        packageName: 'br.com.intermedium',
      ),
      InfoBankAppModel(
        imagePath: AppImages.mp,
        packageName: 'com.mercadopago.wallet',
      ),
    ];

    expect(bankApps.length, equals(expectedBankApps.length));

    for (int i = 0; i < expectedBankApps.length; i++) {
      expect(bankApps[i].imagePath, equals(expectedBankApps[i].imagePath));
      expect(bankApps[i].packageName, equals(expectedBankApps[i].packageName));
    }

    logger.d("bank_apps_test: [Bank apps are correct]");
  });
}

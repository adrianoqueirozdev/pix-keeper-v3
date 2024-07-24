import 'package:pix_keeper/core/data/models/info_bank_app_model.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';

List<InfoBankAppModel> bankApps = [
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

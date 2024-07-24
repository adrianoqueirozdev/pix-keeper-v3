import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/core/data/models/info_bank_app_model.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';

void main() {
  group('InfoBankAppModel', () {
    final json = {
      'imagePath': AppImages.caixa,
      'packageName': 'br.com.gabba.Caixa',
    };

    // Verifica se o model foi criado corretamente
    test('should be able to create an instance from JSON', () {
      final model = InfoBankAppModel.fromJson(json);

      expect(model.imagePath, AppImages.caixa);
      expect(model.packageName, 'br.com.gabba.Caixa');
    });

    // Verifica se o model foi convertido corretamente para JSON
    test('should be able to convert an instance to JSON', () {
      final model = InfoBankAppModel(
        imagePath: AppImages.caixa,
        packageName: 'br.com.gabba.Caixa',
      );

      final resultJson = model.toJson();

      expect(resultJson['imagePath'], AppImages.caixa);
      expect(resultJson['packageName'], 'br.com.gabba.Caixa');
    });

    // Verifica se o model foi copiado corretamente
    test('copyWith should return a new instance with updated fields', () {
      final model = InfoBankAppModel(
        imagePath: AppImages.caixa,
        packageName: 'br.com.gabba.Caixa',
      );

      final updatedModel = model.copyWith(imagePath: AppImages.nubank);

      expect(updatedModel.imagePath, AppImages.nubank);
      expect(updatedModel.packageName, model.packageName); // should remain the same
    });

    // Verifica se o model foi copiado corretamente
    test('copyWith should return a new instance with updated fields', () {
      final model = InfoBankAppModel(
        imagePath: AppImages.caixa,
        packageName: 'br.com.gabba.Caixa',
      );

      final updatedModel = model.copyWith(packageName: 'com.nu.production');

      expect(updatedModel.imagePath, model.imagePath);
      expect(updatedModel.packageName, 'com.nu.production');
    });
  });
}

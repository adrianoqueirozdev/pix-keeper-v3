import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/core/data/models/participants_pix_model.dart';

void main() {
  group('ParticipantPixModel', () {
    final json = {
      'ispb': '12345678',
      'nome_reduzido': 'Short Name',
    };

    // Verifica se o model foi criado corretamente
    test('should be able to create an instance from JSON', () {
      final model = ParticipantPixModel.fromJson(json);

      expect(model.ispb, '12345678');
      expect(model.shortName, 'Short Name');
    });

    // Verifica se o model foi convertido corretamente para JSON
    test('should be able to convert an instance to JSON', () {
      final model = ParticipantPixModel(
        ispb: '12345678',
        shortName: 'Short Name',
      );

      final resultJson = model.toJson();

      expect(resultJson['ispb'], '12345678');
      expect(resultJson['nome_reduzido'], 'Short Name');
    });

    // Verifica se o model foi copiado corretamente
    test('copy should return a new instance with updated fields', () {
      final model = ParticipantPixModel(
        ispb: '12345678',
        shortName: 'Short Name',
      );

      final updatedModel = model.copy(shortName: 'Updated Name');

      expect(updatedModel.ispb, model.ispb);
      expect(updatedModel.shortName, 'Updated Name');
    });

    // Verifica se o model esta vazio
    test('isEmpty should return true if both fields are null', () {
      final model = ParticipantPixModel();

      expect(model.isEmpty(), isTrue);
    });

    // Verifica se o model não esta vazio
    test('isEmpty should return false if at least one field is non-null', () {
      final modelWithIspb = ParticipantPixModel(ispb: '12345678');
      final modelWithShortName = ParticipantPixModel(shortName: 'Short Name');
      final modelWithBothFields = ParticipantPixModel(
        ispb: '12345678',
        shortName: 'Short Name',
      );

      expect(modelWithIspb.isEmpty(), isFalse);
      expect(modelWithShortName.isEmpty(), isFalse);
      expect(modelWithBothFields.isEmpty(), isFalse);
    });
  });
}

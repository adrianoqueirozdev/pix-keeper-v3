import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/data/models/pix_key_type.dart';

void main() {
  group('PixKeyModel', () {
    final json = {
      'id': '123',
      'name': 'Sample Key',
      'key': 'key123',
      'pixKeyType': 'email',
      'pixKeyTypeLabel': 'Email',
      'favoredName': 'Favorite Name',
      'institutionShortName': 'Institution',
      'institutionIspb': '12345678',
      'isFavorite': true,
      'userId': 'user123',
      'createdAt': '2024-01-01T00:00:00Z',
      'updatedAt': '2024-01-02T00:00:00Z',
      'deletedAt': null,
      'copiedAt': null,
    };

    // Verifica se o model foi criado corretamente
    test('should be able to create an instance from JSON', () {
      final model = PixKeyModel.fromJson(json);

      expect(model.id, '123');
      expect(model.name, 'Sample Key');
      expect(model.key, 'key123');
      expect(model.pixKeyType, PixKeyType.email);
      expect(model.pixKeyTypeLabel, 'Email');
      expect(model.favoredName, 'Favorite Name');
      expect(model.institutionShortName, 'Institution');
      expect(model.institutionIspb, '12345678');
      expect(model.isFavorite, true);
      expect(model.userId, 'user123');
      expect(model.createdAt, '2024-01-01T00:00:00Z');
      expect(model.updatedAt, '2024-01-02T00:00:00Z');
      expect(model.deletedAt, isNull);
      expect(model.copiedAt, isNull);
    });

    // Verifica se o model foi convertido corretamente para JSON
    test('should be able to convert an instance to JSON', () {
      final model = PixKeyModel(
        id: '123',
        name: 'Sample Key',
        key: 'key123',
        pixKeyType: PixKeyType.email,
        pixKeyTypeLabel: 'Email',
        favoredName: 'Favorite Name',
        institutionShortName: 'Institution',
        institutionIspb: '12345678',
        isFavorite: true,
        userId: 'user123',
        createdAt: '2024-01-01T00:00:00Z',
        updatedAt: '2024-01-02T00:00:00Z',
        deletedAt: null,
        copiedAt: null,
      );

      final resultJson = model.toJson();

      expect(resultJson['id'], '123');
      expect(resultJson['name'], 'Sample Key');
      expect(resultJson['key'], 'key123');
      expect(resultJson['pixKeyType'], 'email');
      expect(resultJson['pixKeyTypeLabel'], 'Email');
      expect(resultJson['favoredName'], 'Favorite Name');
      expect(resultJson['institutionShortName'], 'Institution');
      expect(resultJson['institutionIspb'], '12345678');
      expect(resultJson['isFavorite'], true);
      expect(resultJson['userId'], 'user123');
      expect(resultJson['createdAt'], '2024-01-01T00:00:00Z');
      expect(resultJson['updatedAt'], '2024-01-02T00:00:00Z');
      expect(resultJson['deletedAt'], isNull);
      expect(resultJson['copiedAt'], isNull);
    });

    // Verifica se o model foi copiado corretamente
    test('copyWith should return a new instance with updated fields', () {
      final model = PixKeyModel(
        id: '123',
        name: 'Sample Key',
        key: 'key123',
        pixKeyType: PixKeyType.email,
        pixKeyTypeLabel: 'Email',
        favoredName: 'Favorite Name',
        institutionShortName: 'Institution',
        institutionIspb: '12345678',
        isFavorite: true,
        userId: 'user123',
        createdAt: '2024-01-01T00:00:00Z',
        updatedAt: '2024-01-02T00:00:00Z',
        deletedAt: null,
        copiedAt: null,
      );

      final updatedModel = model.copyWith(name: 'Updated Name', isFavorite: false);

      expect(updatedModel.id, model.id);
      expect(updatedModel.key, model.key);
      expect(updatedModel.pixKeyType, model.pixKeyType);
      expect(updatedModel.pixKeyTypeLabel, model.pixKeyTypeLabel);
      expect(updatedModel.favoredName, model.favoredName);
      expect(updatedModel.institutionShortName, model.institutionShortName);
      expect(updatedModel.institutionIspb, model.institutionIspb);
      expect(updatedModel.userId, model.userId);
      expect(updatedModel.createdAt, model.createdAt);
      expect(updatedModel.updatedAt, model.updatedAt);
      expect(updatedModel.deletedAt, model.deletedAt);
      expect(updatedModel.copiedAt, model.copiedAt);
      expect(updatedModel.name, 'Updated Name');
      expect(updatedModel.isFavorite, false);
    });
  });
}

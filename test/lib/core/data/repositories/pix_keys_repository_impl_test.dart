import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/config/dependency_injection.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/data/models/pix_key_type.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/shared/constants/firebase_collections.dart';

import '../../../config/firebase_mock.dart';

void main() {
  // Inicializa o Firebase com o mock
  setupFirebaseAuthMocks();

  late FakeFirebaseFirestore fakeFirestore;
  late PixKeysRepositoryImpl repository;
  const userId = 'testUserId';

  setUp(() async {
    // Inicializa o Firebase
    await Firebase.initializeApp();

    // Injeta as dependências
    DependencyInjection.init();

    // Cria o fakeFirestore
    fakeFirestore = FakeFirebaseFirestore();

    // Cria o repository e associa o fakeFirestore
    repository = PixKeysRepositoryImpl(userId: userId)..db = fakeFirestore;
  });

  group('PixKeysRepositoryImpl', () {
    const id = '3d491e1f-575c-4f3f-9347-d38280616509';
    const name = 'Caixa Econômica';
    const key = '043.345.456-78';
    const pixKeyType = PixKeyType.cpf;

    final pixKeyModel = PixKeyModel(
      id: id,
      name: name,
      key: key,
      pixKeyType: pixKeyType,
    );

    // Testa se o PixKeyModel foi criado
    test('should create a PixKeyModel', () async {
      await repository.create(pixKeyModel);
      final doc = await fakeFirestore
          .collection(FirebaseCollections.users)
          .doc(userId)
          .collection(FirebaseCollections.pixKeys)
          .doc(id)
          .get();

      expect(doc.exists, true);
      expect(doc.data(), pixKeyModel.toJson());
    });

    // Testa se o PixKeyModel foi deletado
    test('should delete a PixKeyModel', () async {
      await repository.create(pixKeyModel);
      await repository.delete(id);
      final doc = await fakeFirestore
          .collection(FirebaseCollections.users)
          .doc(userId)
          .collection(FirebaseCollections.pixKeys)
          .doc(id)
          .get();

      expect(doc.exists, true);
      expect(doc.data()![PixKeysFields.deletedAt], isNotNull);
    });

    // Testa se o PixKeyModel foi recuperado
    test('should get a PixKeyModel', () async {
      await repository.create(pixKeyModel);
      final fetchedPixKey = await repository.get(id);

      expect(fetchedPixKey.id, pixKeyModel.id);
      expect(fetchedPixKey.name, pixKeyModel.name);
    });

    // Testa se o PixKeyModel foi atualizado
    test('should update a PixKeyModel', () async {
      await repository.create(pixKeyModel);

      final updatedPixKeyModel = pixKeyModel.copyWith(name: 'Mercado Pago');
      await repository.update(updatedPixKeyModel);

      final doc = await fakeFirestore
          .collection(FirebaseCollections.users)
          .doc(userId)
          .collection(FirebaseCollections.pixKeys)
          .doc(id)
          .get();

      expect(doc.data()![PixKeysFields.name], 'Mercado Pago');
    });

    // Testa se os PixKeyModels foram recuperados
    test('should return all PixKeyModels', () async {
      final pixKeyModel1 = PixKeyModel(
        id: 'c66dfa7b-5452-4aa8-8578-f21889b8f382',
        name: 'Mercado Pago',
        key: '(84) 96798-3456',
        pixKeyType: PixKeyType.phone,
      );

      final pixKeyModel2 = PixKeyModel(
        id: 'd50a38df-0361-450e-8a0c-e034d5c1722d',
        name: 'Nubank',
        key: 'name@nubank.com',
        pixKeyType: PixKeyType.email,
      );

      await repository.create(pixKeyModel1);
      await repository.create(pixKeyModel2);

      final pixKeys = await repository.getAll();

      expect(pixKeys.length, 2);
      expect(
          pixKeys.map((e) => e.id),
          containsAll([
            'c66dfa7b-5452-4aa8-8578-f21889b8f382',
            'd50a38df-0361-450e-8a0c-e034d5c1722d',
          ]));
    });

    // Testa se os PixKeyModels deletados foram recuperados
    test('should return all deleted PixKeyModels', () async {
      final pixKeyModel1 = PixKeyModel(
        id: 'c66dfa7b-5452-4aa8-8578-f21889b8f382',
        name: 'Mercado Pago',
        key: '(84) 96798-3456',
        pixKeyType: PixKeyType.phone,
      );

      final pixKeyModel2 = PixKeyModel(
        id: 'd50a38df-0361-450e-8a0c-e034d5c1722d',
        name: 'Nubank',
        key: 'name@nubank.com',
        pixKeyType: PixKeyType.email,
      );

      await repository.create(pixKeyModel1);
      await repository.create(pixKeyModel2);

      await repository.delete('c66dfa7b-5452-4aa8-8578-f21889b8f382');
      final deletedPixKeys = await repository.getAllDeleted();

      expect(deletedPixKeys.length, 1);
      expect(deletedPixKeys.first.id, 'c66dfa7b-5452-4aa8-8578-f21889b8f382');
    });

    // Testa se o PixKeyModel foi restaurado
    test('should restore a deleted PixKeyModel', () async {
      await repository.create(pixKeyModel);
      await repository.delete(id);
      await repository.restore(id);

      final doc = await fakeFirestore
          .collection(FirebaseCollections.users)
          .doc(userId)
          .collection(FirebaseCollections.pixKeys)
          .doc(id)
          .get();

      expect(doc.data()![PixKeysFields.deletedAt], isNull);
    });

    // Testa se o PixKeyModel foi copiado
    test('should update copiedAt for a PixKeyModel', () async {
      await repository.create(pixKeyModel);
      await repository.copy(id);

      final doc = await fakeFirestore
          .collection(FirebaseCollections.users)
          .doc(userId)
          .collection(FirebaseCollections.pixKeys)
          .doc(id)
          .get();

      expect(doc.data()![PixKeysFields.copiedAt], isNotNull);
    });

    // Testa se todos os PixKeyModels foram deletados
    test('should delete all deleted PixKeyModels', () async {
      await repository.create(pixKeyModel);
      await repository.delete(id);
      await repository.deleteAll();

      final query = await fakeFirestore
          .collection(FirebaseCollections.users)
          .doc(userId)
          .collection(FirebaseCollections.pixKeys)
          .where(PixKeysFields.deletedAt, isNull: false)
          .get();

      expect(query.docs.isEmpty, true);
    });
  });
}

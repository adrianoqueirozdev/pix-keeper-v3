import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/domain/repositories/base_repository.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';
import 'package:pix_keeper/core/utils/user_manager.dart';
import 'package:pix_keeper/shared/constants/firebase_collections.dart';

class PixKeysRepositoryImpl extends BaseRepository implements PixKeysRepository {
  PixKeysRepositoryImpl({String? userId}) : super(userId: userId ?? UserManager().userId!);

  @override
  Future<PixKeyModel> create(PixKeyModel pixKeyModel) async {
    await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .doc(pixKeyModel.id)
        .set(pixKeyModel.toJson());
    return pixKeyModel;
  }

  @override
  Future<void> delete(String id) async {
    await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .doc(id)
        .update({PixKeysFields.deletedAt: DateTime.now().toIso8601String()});
  }

  @override
  Future<PixKeyModel> get(String id) async {
    DocumentSnapshot doc = await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .doc(id)
        .get();

    return fromFirestore(doc, PixKeyModel.fromJson);
  }

  @override
  Future<List<PixKeyModel>> getAll() async {
    QuerySnapshot query = await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .orderBy(PixKeysFields.copiedAt, descending: true)
        .where(PixKeysFields.deletedAt, isNull: true)
        .get();

    return query.docs.map((doc) => fromFirestore(doc, PixKeyModel.fromJson)).toList();
  }

  @override
  Future<PixKeyModel> update(PixKeyModel pixKeyModel) async {
    await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .doc(pixKeyModel.id)
        .update(pixKeyModel.toJson());

    return pixKeyModel;
  }

  @override
  Future<void> copy(String id) async {
    await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .doc(id)
        .update({'copiedAt': DateTime.now().toIso8601String()});
  }

  @override
  Future<List<PixKeyModel>> getAllDeleted() async {
    QuerySnapshot query = await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .orderBy(PixKeysFields.deletedAt, descending: true)
        .where(PixKeysFields.deletedAt, isNull: false)
        .get();

    return query.docs.map((doc) => fromFirestore(doc, PixKeyModel.fromJson)).toList();
  }

  @override
  Future<void> restore(String id) async {
    await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .doc(id)
        .update({PixKeysFields.deletedAt: null});
  }

  @override
  Future<void> deleteAll() async {
    QuerySnapshot query = await db
        .collection(FirebaseCollections.users)
        .doc(userId)
        .collection(FirebaseCollections.pixKeys)
        .where(PixKeysFields.deletedAt, isNull: false)
        .get();

    for (DocumentSnapshot doc in query.docs) {
      await db
          .collection(FirebaseCollections.users)
          .doc(userId)
          .collection(FirebaseCollections.pixKeys)
          .doc(doc.id)
          .delete();
    }
  }
}

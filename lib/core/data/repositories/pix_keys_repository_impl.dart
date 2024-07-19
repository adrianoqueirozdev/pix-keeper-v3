import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';

const _pixKeysCollection = 'pix_keys';

class PixKeysRepositoryImpl implements PixKeysRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Future<PixKeyModel> create(PixKeyModel pixKeyModel) async {
    await db.collection(_pixKeysCollection).doc(pixKeyModel.id).set(pixKeyModel.toJson());
    return pixKeyModel;
  }

  @override
  Future<void> delete(String id) async {
    await db.collection(_pixKeysCollection).doc(id).update({PixKeysFields.deletedAt: DateTime.now().toIso8601String()});
  }

  @override
  Future<PixKeyModel> get(String id) async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<PixKeyModel>> getAll() async {
    QuerySnapshot query = await db
        .collection(_pixKeysCollection)
        .orderBy(PixKeysFields.copiedAt, descending: true)
        .where(PixKeysFields.userId, isEqualTo: user!.uid)
        .where(PixKeysFields.deletedAt, isNull: true)
        .get();
    return query.docs.map((doc) => PixKeyModel.fromJson(jsonDecode(jsonEncode(doc.data())))).toList();
  }

  @override
  Future<PixKeyModel> update(PixKeyModel pixKeyModel) async {
    await db.collection(_pixKeysCollection).doc(pixKeyModel.id).update(pixKeyModel.toJson());
    return pixKeyModel;
  }

  @override
  Future<void> copy(String id) async {
    await db.collection(_pixKeysCollection).doc(id).update({'copiedAt': DateTime.now().toIso8601String()});
  }

  @override
  Future<List<PixKeyModel>> getAllDeleted() async {
    QuerySnapshot query = await db
        .collection(_pixKeysCollection)
        .orderBy(PixKeysFields.deletedAt, descending: true)
        .where(PixKeysFields.userId, isEqualTo: user!.uid)
        .where(PixKeysFields.deletedAt, isNull: false)
        .get();
    return query.docs.map((doc) => PixKeyModel.fromJson(jsonDecode(jsonEncode(doc.data())))).toList();
  }

  @override
  Future<void> restore(String id) async {
    await db.collection(_pixKeysCollection).doc(id).update({PixKeysFields.deletedAt: null});
  }
}

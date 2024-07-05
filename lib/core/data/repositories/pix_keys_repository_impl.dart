import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';

class PixKeysRepositoryImpl implements PixKeysRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<PixKeyModel> create(PixKeyModel pixKeyModel) async {
    await db.collection('pix_keys').doc(pixKeyModel.id).set(pixKeyModel.toJson());

    return pixKeyModel;
  }

  @override
  Future<PixKeyModel> delete(String id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PixKeyModel> get(String id) async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<PixKeyModel>> getAll() async {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<PixKeyModel> update(PixKeyModel pixKeyModel) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}

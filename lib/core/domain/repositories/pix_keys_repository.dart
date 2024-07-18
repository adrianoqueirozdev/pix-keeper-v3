import 'package:pix_keeper/core/data/models/pix_key.dart';

abstract class PixKeysRepository {
  Future<List<PixKeyModel>> getAll();

  Future<List<PixKeyModel>> getAllDeleted();

  Future<PixKeyModel> get(String id);

  Future<PixKeyModel> create(PixKeyModel pixKeyModel);

  Future<PixKeyModel> update(PixKeyModel pixKeyModel);

  Future<void> delete(String id);

  Future<void> restore(String id);

  Future<void> copy(String id);
}

import 'package:pix_keeper/core/data/models/pix_key.dart';

abstract class PixKeysRepository {
  Future<List<PixKeyModel>> getAll();

  Future<PixKeyModel> get(String id);

  Future<PixKeyModel> create(PixKeyModel pixKeyModel);

  Future<PixKeyModel> update(PixKeyModel pixKeyModel);

  Future<PixKeyModel> delete(String id);
}

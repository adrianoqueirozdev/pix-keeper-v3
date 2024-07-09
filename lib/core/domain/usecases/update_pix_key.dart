import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';

class UpdatePixKey {
  UpdatePixKey({required PixKeysRepository repository}) : _repository = repository;

  final PixKeysRepository _repository;

  Future<PixKeyModel> call(PixKeyModel pixKeyModel) async {
    return await _repository.update(pixKeyModel);
  }
}

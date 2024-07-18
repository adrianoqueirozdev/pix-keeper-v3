import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';

class RestorePixKey {
  RestorePixKey({required PixKeysRepository repository}) : _repository = repository;

  final PixKeysRepository _repository;

  Future<void> call(String id) async {
    await _repository.restore(id);
  }
}

import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';

class DeletePixKey {
  DeletePixKey({required PixKeysRepository repository}) : _repository = repository;

  final PixKeysRepository _repository;

  Future<void> call(String id) async {
    await _repository.delete(id);
  }
}

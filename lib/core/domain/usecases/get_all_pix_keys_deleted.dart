import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';

class GetAllPixKeysDeleted {
  GetAllPixKeysDeleted({required PixKeysRepository repository}) : _repository = repository;

  final PixKeysRepository _repository;

  Future<List<PixKeyModel>> call() async {
    return await _repository.getAllDeleted();
  }
}

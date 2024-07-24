import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';
import 'package:pix_keeper/core/domain/usecases/use_case.dart';

class CopyPixKey implements UseCase<void, String> {
  final PixKeysRepository _repository;

  CopyPixKey({required PixKeysRepository repository}) : _repository = repository;

  @override
  Future<void> call(String id) async {
    await _repository.copy(id);
  }
}

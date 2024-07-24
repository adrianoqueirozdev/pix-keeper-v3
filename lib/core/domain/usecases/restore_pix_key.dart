import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';
import 'package:pix_keeper/core/domain/usecases/use_case.dart';

class RestorePixKey implements UseCase<void, String> {
  final PixKeysRepository _repository;

  RestorePixKey({required PixKeysRepository repository}) : _repository = repository;

  @override
  Future<void> call(String id) async {
    await _repository.restore(id);
  }
}

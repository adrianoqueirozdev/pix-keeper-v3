import 'package:pix_keeper/core/domain/common/no_params.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';
import 'package:pix_keeper/core/domain/usecases/use_case.dart';

class DeleteAllPixKeys extends UseCase<void, NoParams> {
  final PixKeysRepository _repository;

  DeleteAllPixKeys({required PixKeysRepository repository}) : _repository = repository;

  @override
  Future<void> call(NoParams params) async {
    await _repository.deleteAll();
  }
}

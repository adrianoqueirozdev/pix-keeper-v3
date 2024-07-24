import 'package:pix_keeper/core/domain/common/no_params.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/domain/usecases/use_case.dart';

class GetAllPixKeysDeleted implements UseCase<List<PixKeyModel>, NoParams> {
  final PixKeysRepository _repository;

  GetAllPixKeysDeleted({required PixKeysRepository repository}) : _repository = repository;

  @override
  Future<List<PixKeyModel>> call(NoParams params) async {
    return await _repository.getAllDeleted();
  }
}

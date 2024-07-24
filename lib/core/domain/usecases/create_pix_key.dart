import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/domain/repositories/pix_keys_repository.dart';
import 'package:pix_keeper/core/domain/usecases/use_case.dart';

class CreatePixKey implements UseCase<PixKeyModel, PixKeyModel> {
  final PixKeysRepository _repository;

  CreatePixKey({required PixKeysRepository repository}) : _repository = repository;

  @override
  Future<PixKeyModel> call(PixKeyModel pixKeyModel) async {
    return await _repository.create(pixKeyModel);
  }
}

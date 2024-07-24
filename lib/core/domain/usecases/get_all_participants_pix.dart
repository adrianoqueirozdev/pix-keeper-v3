import 'package:pix_keeper/core/data/models/participants_pix_model.dart';
import 'package:pix_keeper/core/domain/common/no_params.dart';
import 'package:pix_keeper/core/domain/repositories/participants_pix_repository.dart';
import 'package:pix_keeper/core/domain/usecases/use_case.dart';

class GetAllParticipantsPix implements UseCase<List<ParticipantPixModel>, NoParams> {
  final ParticipantsPixRepository _repository;

  GetAllParticipantsPix({required ParticipantsPixRepository repository}) : _repository = repository;

  @override
  Future<List<ParticipantPixModel>> call(NoParams params) async {
    return _repository.getAll();
  }
}

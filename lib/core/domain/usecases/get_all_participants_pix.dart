import 'package:pix_keeper/core/data/models/participants_pix.dart';
import 'package:pix_keeper/core/domain/repositories/participants_pix_repository.dart';

class GetAllParticipantsPix {
  GetAllParticipantsPix({required ParticipantsPixRepository repository}) : _repository = repository;

  final ParticipantsPixRepository _repository;

  Future<List<ParticipantPix>> call() async {
    return await _repository.getAll();
  }
}

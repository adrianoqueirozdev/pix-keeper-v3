import 'package:pix_keeper/core/data/models/participants_pix.dart';
import 'package:pix_keeper/core/domain/repositories/participants_pix_repository.dart';
import 'package:pix_keeper/shared/constants/environments.dart';
import 'package:pix_keeper/shared/http/pix_keeper_api.dart';

class ParticipantsPixRepositoryImpl implements ParticipantsPixRepository {
  final PixKeeperApi pixKeeperApi = PixKeeperApi(Environments.brasilApiUrl);

  @override
  Future<List<ParticipantPix>> getAll() async {
    final response = await pixKeeperApi.get('participants');

    return response.map<ParticipantPix>((participant) => ParticipantPix.fromJson(participant)).toList();
  }
}

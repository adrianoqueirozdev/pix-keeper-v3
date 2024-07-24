import 'package:pix_keeper/core/data/models/participants_pix_model.dart';
import 'package:pix_keeper/core/domain/repositories/participants_pix_repository.dart';
import 'package:pix_keeper/shared/constants/environments.dart';
import 'package:pix_keeper/core/data/network/pix_keeper_api.dart';

class ParticipantsPixRepositoryImpl implements ParticipantsPixRepository {
  late final PixKeeperApi pixKeeperApi;

  ParticipantsPixRepositoryImpl() : super() {
    pixKeeperApi = PixKeeperApi(Environments.brasilApiUrl);
  }

  @override
  Future<List<ParticipantPixModel>> getAll() async {
    final response = await pixKeeperApi.get('participants');

    return response.map<ParticipantPixModel>((participant) => ParticipantPixModel.fromJson(participant)).toList();
  }
}

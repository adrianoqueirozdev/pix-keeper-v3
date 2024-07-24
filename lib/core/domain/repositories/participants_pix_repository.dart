import 'package:pix_keeper/core/data/models/participants_pix_model.dart';

abstract interface class ParticipantsPixRepository {
  Future<List<ParticipantPixModel>> getAll();
}

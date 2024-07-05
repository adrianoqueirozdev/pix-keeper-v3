import 'package:pix_keeper/core/data/models/participants_pix.dart';

abstract interface class ParticipantsPixRepository {
  Future<List<ParticipantPix>> getAll();
}

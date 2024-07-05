import 'package:pix_keeper/core/data/models/participants_pix.dart';

abstract class ParticipantsPixState {
  List<ParticipantPix> participantsPix;

  ParticipantsPixState({required this.participantsPix});
}

class ParticipantsPixInitialState extends ParticipantsPixState {
  ParticipantsPixInitialState() : super(participantsPix: []);
}

class ParticipantsPixLoadedState extends ParticipantsPixState {
  ParticipantsPixLoadedState({required super.participantsPix});
}

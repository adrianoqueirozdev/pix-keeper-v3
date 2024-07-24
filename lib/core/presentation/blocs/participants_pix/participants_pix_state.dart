import 'package:pix_keeper/core/data/models/participants_pix_model.dart';

abstract class ParticipantsPixState {
  List<ParticipantPixModel> participantsPix;

  ParticipantsPixState({this.participantsPix = const []});
}

class ParticipantsPixInitialState extends ParticipantsPixState {
  ParticipantsPixInitialState() : super(participantsPix: []);
}

class ParticipantsPixLoadingState extends ParticipantsPixState {}

class ParticipantsPixLoadedState extends ParticipantsPixState {
  ParticipantsPixLoadedState({required super.participantsPix});
}

class ParticipantsPixErrorState extends ParticipantsPixState {
  final String error;

  ParticipantsPixErrorState({required this.error}) : super(participantsPix: []);
}

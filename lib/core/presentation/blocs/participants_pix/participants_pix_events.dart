abstract class ParticipantsPixEvents {}

class LoadParticipantsPixEvent extends ParticipantsPixEvents {}

class FilterParticipantsPixEvent extends ParticipantsPixEvents {
  final String search;

  FilterParticipantsPixEvent(this.search);
}

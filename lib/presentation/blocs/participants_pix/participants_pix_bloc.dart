import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pix_keeper/core/data/models/participants_pix.dart';
import 'package:pix_keeper/core/data/repositories/participants_pix_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_participants_pix.dart';
import 'package:pix_keeper/presentation/blocs/participants_pix/participants_pix_events.dart';
import 'package:pix_keeper/presentation/blocs/participants_pix/participants_pix_state.dart';

class ParticipantsPixBloc extends Bloc<ParticipantsPixEvents, ParticipantsPixState> {
  final GetAllParticipantsPix getAllParticipantsPix =
      GetAllParticipantsPix(repository: ParticipantsPixRepositoryImpl());

  ParticipantsPixBloc() : super(ParticipantsPixInitialState()) {
    on((_mapEventToState));
  }

  void _mapEventToState(ParticipantsPixEvents event, Emitter emit) async {
    List<ParticipantPix> participantsPix = state.participantsPix;

    if (event is LoadParticipantsPixEvent) {
      participantsPix = await getAllParticipantsPix.call();
    }

    if (event is FilterParticipantsPixEvent) {
      participantsPix = participantsPix
          .where((p) => _checkQuery(p.shortName ?? '', event.search) || _checkQuery(p.ispb ?? '', event.search))
          .toList();
    }

    emit(ParticipantsPixLoadedState(participantsPix: participantsPix));
  }

  bool _checkQuery(String search, String value) => search.toLowerCase().contains(value.toLowerCase());
}

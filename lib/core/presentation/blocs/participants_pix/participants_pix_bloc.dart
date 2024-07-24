import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pix_keeper/core/domain/common/no_params.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_participants_pix.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_events.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_state.dart';

class ParticipantsPixBloc extends Bloc<ParticipantsPixEvents, ParticipantsPixState> {
  final GetAllParticipantsPix _getAllParticipantsPix;

  ParticipantsPixBloc({
    required GetAllParticipantsPix getAllParticipantsPix,
  })  : _getAllParticipantsPix = getAllParticipantsPix,
        super(ParticipantsPixInitialState()) {
    on<LoadParticipantsPixEvent>(_onLoadParticipantsPixEvent);
    on<FilterParticipantsPixEvent>(_onFilterParticipantsPixEvent);
  }

  Future<void> _onLoadParticipantsPixEvent(LoadParticipantsPixEvent event, Emitter<ParticipantsPixState> emit) async {
    emit(ParticipantsPixLoadingState());

    try {
      final participantsPix = await _getAllParticipantsPix.call(NoParams());
      emit(ParticipantsPixLoadedState(participantsPix: participantsPix));
    } catch (e) {
      emit(ParticipantsPixErrorState(error: e.toString()));
    }
  }

  void _onFilterParticipantsPixEvent(FilterParticipantsPixEvent event, Emitter<ParticipantsPixState> emit) {
    if (state is ParticipantsPixLoadedState) {
      final currentState = state as ParticipantsPixLoadedState;
      final filteredParticipantsPix = currentState.participantsPix
          .where((p) => _checkQuery(p.shortName ?? '', event.search) || _checkQuery(p.ispb ?? '', event.search))
          .toList();
      emit(ParticipantsPixLoadedState(participantsPix: filteredParticipantsPix));
    }
  }

  bool _checkQuery(String search, String value) => search.toLowerCase().contains(value.toLowerCase());
}

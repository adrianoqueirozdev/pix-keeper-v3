import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pix_keeper/core/domain/common/no_params.dart';
import 'package:pix_keeper/core/domain/usecases/create_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/delete_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys.dart';
import 'package:pix_keeper/core/domain/usecases/update_pix_key.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_state.dart';

class PixKeyBloc extends Bloc<PixKeyEvent, PixKeyState> {
  final CreatePixKey _createPixKey;
  final GetAllPixKeys _getAllPixKeys;
  final DeletePixKey _deletePixKey;
  final UpdatePixKey _updatePixKey;

  PixKeyBloc({
    required CreatePixKey createPixKey,
    required GetAllPixKeys getAllPixKeys,
    required DeletePixKey deletePixKey,
    required UpdatePixKey updatePixKey,
  })  : _createPixKey = createPixKey,
        _getAllPixKeys = getAllPixKeys,
        _deletePixKey = deletePixKey,
        _updatePixKey = updatePixKey,
        super(PixKeyInitialState()) {
    on<LoadPixKeysEvent>(_onLoadPixKeysEvent);
    on<CreatePixKeyEvent>(_onCreatePixKeyEvent);
    on<UpdatePixKeyEvent>(_onUpdatePixKeyEvent);
    on<DeletePixKeyEvent>(_onDeletePixKeyEvent);
  }

  Future<void> _onLoadPixKeysEvent(LoadPixKeysEvent event, Emitter<PixKeyState> emit) async {
    emit(PixKeyInitialState());
    try {
      final pixKeys = await _getAllPixKeys.call(NoParams());
      emit(PixKeyLoadedState(pixKeys: pixKeys));
    } catch (e) {
      emit(PixKeyErrorState(error: e.toString()));
    }
  }

  Future<void> _onCreatePixKeyEvent(CreatePixKeyEvent event, Emitter<PixKeyState> emit) async {
    emit(CreatePixKeyLoadingState());
    try {
      final result = await _createPixKey.call(event.pixKeyModel);
      emit(CreatePixKeySuccessState(pixKey: result));
    } catch (e) {
      emit(CreatePixKeyErrorState(error: e.toString()));
    }
  }

  Future<void> _onUpdatePixKeyEvent(UpdatePixKeyEvent event, Emitter<PixKeyState> emit) async {
    emit(UpdatePixKeyLoadingState());
    try {
      final result = await _updatePixKey.call(event.pixKeyModel);
      emit(UpdatePixKeySuccessState(pixKey: result));
    } catch (e) {
      emit(UpdatePixKeyErrorState(error: e.toString()));
    }
  }

  Future<void> _onDeletePixKeyEvent(DeletePixKeyEvent event, Emitter<PixKeyState> emit) async {
    emit(DeletePixKeyLoadingState());
    try {
      await _deletePixKey.call(event.id);
      emit(DeletePixKeySuccessState());
    } catch (e) {
      emit(DeletePixKeyErrorState(error: e.toString()));
    }
  }
}

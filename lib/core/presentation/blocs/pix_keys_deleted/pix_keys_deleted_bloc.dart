import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pix_keeper/core/domain/common/no_params.dart';
import 'package:pix_keeper/core/domain/usecases/delete_all_pix_keys.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys_deleted.dart';
import 'package:pix_keeper/core/domain/usecases/restore_pix_key.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_events.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_state.dart';

class PixKeysDeletedBloc extends Bloc<PixKeysDeletedEvents, PixKeysDeletedState> {
  final GetAllPixKeysDeleted _getAllPixKeysDeleted;
  final RestorePixKey _restorePixKey;
  final DeleteAllPixKeys _deleteAllPixKeys;

  PixKeysDeletedBloc({
    required GetAllPixKeysDeleted getAllPixKeysDeleted,
    required RestorePixKey restorePixKey,
    required DeleteAllPixKeys deleteAllPixKeys,
  })  : _getAllPixKeysDeleted = getAllPixKeysDeleted,
        _restorePixKey = restorePixKey,
        _deleteAllPixKeys = deleteAllPixKeys,
        super(PixKeysDeletedInitialState()) {
    on<LoadAllPixKeysDeletedEvent>(_onPixKeysDeletedEvent);
    on<RestorePixKeyEvent>(_onRestorePixKeyEvent);
    on<EmptyTheTrashCanEvent>(_onEmptyTheTrashCanEvent);
  }

  void _onPixKeysDeletedEvent(PixKeysDeletedEvents event, Emitter<PixKeysDeletedState> emit) async {
    if (event is LoadAllPixKeysDeletedEvent) {
      try {
        emit(PixKeysDeletedInitialState());
        final pixKeys = await _getAllPixKeysDeleted.call(NoParams());
        emit(PixKeysDeletedSuccessState(pixKeys: pixKeys));
      } catch (e) {
        emit(PixKeysDeletedErrorState(error: e.toString()));
      }
    }
  }

  void _onRestorePixKeyEvent(RestorePixKeyEvent event, Emitter<PixKeysDeletedState> emit) async {
    try {
      emit(PixKeysDeletedInitialState());
      await _restorePixKey.call(event.id);
      add(LoadAllPixKeysDeletedEvent());
    } catch (e) {
      emit(PixKeysDeletedErrorState(error: e.toString()));
    }
  }

  void _onEmptyTheTrashCanEvent(EmptyTheTrashCanEvent event, Emitter<PixKeysDeletedState> emit) async {
    try {
      emit(PixKeysDeletedInitialState());
      await _deleteAllPixKeys.call(NoParams());
      emit(EmptyTheTrashCanSuccessState());
      add(LoadAllPixKeysDeletedEvent());
    } catch (e) {
      emit(EmptyTheTrashCanErrorState(error: e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys_deleted.dart';
import 'package:pix_keeper/core/domain/usecases/restore_pix_key.dart';
import 'package:pix_keeper/presentation/blocs/pix_keys_deleted/pix_keys_deleted_events.dart';
import 'package:pix_keeper/presentation/blocs/pix_keys_deleted/pix_keys_deleted_state.dart';

class PixKeysDeletedBloc extends Bloc<PixKeysDeletedEvents, PixKeysDeletedState> {
  PixKeysDeletedBloc() : super(PixKeysDeletedInitialState()) {
    on((_mapEventToState));
  }

  void _mapEventToState(PixKeysDeletedEvents event, Emitter emit) async {
    final pixKeyRepository = PixKeysRepositoryImpl();

    final GetAllPixKeysDeleted getAllPixKeysDeleted = GetAllPixKeysDeleted(repository: pixKeyRepository);
    final RestorePixKey restorePixKey = RestorePixKey(repository: pixKeyRepository);

    List<PixKeyModel> pixKeys = state.pixKeys ?? [];

    if (event is LoadAllPixKeysDeletedEvent) {
      emit(PixKeysDeletedInitialState());
      pixKeys = await getAllPixKeysDeleted.call();
    }

    if (event is RestorePixKeyEvent) {
      emit(PixKeysDeletedInitialState());
      await restorePixKey.call(event.id);
      pixKeys = await getAllPixKeysDeleted.call();
    }

    emit(PixKeysDeletedSuccessState(pixKeys: pixKeys));
  }
}

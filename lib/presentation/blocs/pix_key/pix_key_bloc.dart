import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/create_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/delete_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_state.dart';

class PixKeyBloc extends Bloc<PixKeyEvents, PixKeyState> {
  PixKeyBloc() : super(PixKeyInitialState()) {
    on((_mapEventToState));
  }

  void _mapEventToState(PixKeyEvents event, Emitter emit) async {
    final pixKeyRepository = PixKeysRepositoryImpl();

    final CreatePixKey createPixKey = CreatePixKey(repository: pixKeyRepository);
    final GetAllPixKeys getAllPixKeys = GetAllPixKeys(repository: pixKeyRepository);
    final DeletePixKey deletePixKey = DeletePixKey(repository: pixKeyRepository);

    List<PixKeyModel> pixKeys = state.pixKeys ?? [];

    if (event is LoadPixKeyEvent) {
      emit(PixKeyInitialState());
      pixKeys = await getAllPixKeys.call();
    }

    if (event is CreatePixKeyEvent) {
      emit(CreatePixKeyLoadingState());
      final result = await createPixKey.call(event.pixKeyModel!);
      pixKeys.add(result);
      emit(CreatePixKeySuccessState(pixKey: result));
    }

    if (event is UpdatePixKeyEvent) {
      emit(UpdatePixKeyLoadingState());
      final result = await createPixKey.call(event.pixKeyModel!);
      emit(UpdatePixKeySuccessState(pixKey: result));
    }

    if (event is DeletePixKeyEvent) {
      emit(DeletePixKeyLoadingState());
      await deletePixKey.call(event.id);
      emit(DeletePixKeySuccessState());
    }

    emit(PixKeyLoadedState(pixKeys: pixKeys));
  }
}

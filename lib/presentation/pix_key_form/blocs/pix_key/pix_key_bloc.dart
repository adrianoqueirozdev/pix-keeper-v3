import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/create_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_state.dart';

class PixKeyBloc extends Bloc<PixKeyEvents, PixKeyState> {
  PixKeyBloc() : super(PixKeyInitialState()) {
    on((_mapEventToState));
  }

  void _mapEventToState(PixKeyEvents event, Emitter emit) async {
    final CreatePixKey createPixKey = CreatePixKey(repository: PixKeysRepositoryImpl());
    final GetAllPixKeys getAllPixKeys = GetAllPixKeys(repository: PixKeysRepositoryImpl());

    List<PixKeyModel> pixKeys = state.pixKeys;

    if (event is LoadPixKeyEvent) {
      emit(PixKeyInitialState());
      pixKeys = await getAllPixKeys.call();
    } else if (event is CreatePixKeyEvent) {
      emit(CreatePixKeyLoadingState(pixKeys: pixKeys));

      final result = await createPixKey.call(event.pixKeyModel);
      pixKeys.add(result);
      emit(CreatePixKeySuccessState(pixKeys: pixKeys));
    }

    emit(PixKeyLoadedState(pixKeys: pixKeys));
  }
}

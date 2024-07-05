import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/copy_pix_key.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_events.dart';

class HomePageController extends GetxController {
  late final PixKeyBloc pixKeyBloc;
  late final CopyPixKey copyPixKey;

  void onCopy(PixKeyModel pixKey) async {
    await copyPixKey.call(pixKey.id!);
  }

  @override
  void onInit() {
    pixKeyBloc = PixKeyBloc();

    copyPixKey = CopyPixKey(repository: PixKeysRepositoryImpl());

    pixKeyBloc.add(LoadPixKeyEvent());

    super.onInit();
  }
}

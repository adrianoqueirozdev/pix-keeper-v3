import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_events.dart';

class TrashCanPageController extends GetxController {
  final PixKeysDeletedBloc pixKeysDeletedBloc;

  TrashCanPageController({required this.pixKeysDeletedBloc});

  @override
  void onInit() {
    super.onInit();

    _loadPixKeys();
  }

  void _loadPixKeys() {
    pixKeysDeletedBloc.add(LoadAllPixKeysDeletedEvent());
  }

  Future<void> onRefresh() {
    _loadPixKeys();

    return Future.value();
  }

  void onRestore(PixKeyModel pixKey) {
    pixKeysDeletedBloc.add(RestorePixKeyEvent(pixKey.id!));
  }
}

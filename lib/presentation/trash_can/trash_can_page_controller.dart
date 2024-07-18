import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/presentation/blocs/pix_keys_deleted/pix_keys_deleted_bloc.dart';
import 'package:pix_keeper/presentation/blocs/pix_keys_deleted/pix_keys_deleted_events.dart';
import 'package:pix_keeper/presentation/blocs/pix_keys_deleted/pix_keys_deleted_state.dart';

class TrashCanPageController extends GetxController {
  late final PixKeysDeletedBloc pixKeysDeletedBloc;

  Future<void> onRefresh() async {
    pixKeysDeletedBloc.add(LoadAllPixKeysDeletedEvent());
  }

  void onRestore(PixKeyModel pixKey) {
    pixKeysDeletedBloc.add(RestorePixKeyEvent(pixKey.id!));
  }

  @override
  void onInit() {
    pixKeysDeletedBloc = PixKeysDeletedBloc();

    pixKeysDeletedBloc.add(LoadAllPixKeysDeletedEvent());

    final pixKeyBloc = Get.arguments as PixKeyBloc;

    pixKeysDeletedBloc.stream.listen((event) {
      if (event is PixKeysDeletedSuccessState) {
        pixKeyBloc.add(LoadPixKeyEvent());
      }
    });

    super.onInit();
  }
}

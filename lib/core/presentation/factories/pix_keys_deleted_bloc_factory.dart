import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/usecases/delete_all_pix_keys.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys_deleted.dart';
import 'package:pix_keeper/core/domain/usecases/restore_pix_key.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_bloc.dart';

class PixKeysDeletedBlocFactory {
  static PixKeysDeletedBloc create() {
    final getAllPixKeysDeleted = Get.find<GetAllPixKeysDeleted>();
    final restorePixKey = Get.find<RestorePixKey>();
    final deleteAllPixKeys = Get.find<DeleteAllPixKeys>();

    return PixKeysDeletedBloc(
      getAllPixKeysDeleted: getAllPixKeysDeleted,
      restorePixKey: restorePixKey,
      deleteAllPixKeys: deleteAllPixKeys,
    );
  }
}

import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/usecases/create_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/delete_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys.dart';
import 'package:pix_keeper/core/domain/usecases/update_pix_key.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';

class PixKeyBlocFactory {
  static PixKeyBloc create() {
    final createPixKey = Get.find<CreatePixKey>();
    final getAllPixKeys = Get.find<GetAllPixKeys>();
    final deletePixKey = Get.find<DeletePixKey>();
    final updatePixKey = Get.find<UpdatePixKey>();

    return PixKeyBloc(
      createPixKey: createPixKey,
      getAllPixKeys: getAllPixKeys,
      deletePixKey: deletePixKey,
      updatePixKey: updatePixKey,
    );
  }
}

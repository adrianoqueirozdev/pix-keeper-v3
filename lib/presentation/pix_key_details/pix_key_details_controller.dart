import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/copy_pix_key.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/presentation/pix_key_details/widgets/delete_pix_key_confirm.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';
import 'package:pix_keeper/shared/utils/format_copy_key_pix.dart';
import 'package:share_plus/share_plus.dart';

class PixKeyDetailsController extends GetxController {
  final _pixKeyDetails = PixKeyModel().obs;
  final PixKeysRepositoryImpl _pixKeysRepositoryImpl = PixKeysRepositoryImpl();

  late final CopyController copyController;
  late final CopyPixKey copyPixKey;
  late final PixKeyBloc pixKeyBloc;

  PixKeyModel get pixKeyDetails => _pixKeyDetails.value;

  void onEdit() {
    Get.toNamed(AppRoutes.pixKeyForm, arguments: pixKeyDetails)?.then((onValue) {
      if (onValue != null) {
        _pixKeyDetails.value = onValue as PixKeyModel;
        update();
      }
    });
  }

  void onShare() async {
    await Share.share(formatCopyKeyPix(pixKeyDetails));
  }

  void onDeletePixKey() {
    Get.dialog(DeletePixKeyConfirm(
      pixKeyBloc: pixKeyBloc,
      deletePixKey: () {
        pixKeyBloc.add(DeletePixKeyEvent(pixKeyDetails.id!));
      },
    ));
  }

  @override
  void onInit() {
    copyController = CopyController();
    copyPixKey = CopyPixKey(repository: _pixKeysRepositoryImpl);
    pixKeyBloc = PixKeyBloc();

    final arguments = Get.arguments as PixKeyModel;

    _pixKeyDetails.value = arguments;

    pixKeyBloc.stream.listen((event) {
      if (event is DeletePixKeySuccessState) {
        Get.back();
        Get.back();
      }
    });
    super.onInit();
  }
}

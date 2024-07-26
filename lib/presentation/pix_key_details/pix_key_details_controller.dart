import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/core/utils/new_pix_key_params.dart';
import 'package:pix_keeper/presentation/pix_key_details/widgets/delete_pix_key_confirm.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:pix_keeper/shared/utils/format_pix_key_copy_all.dart';
import 'package:share_plus/share_plus.dart';

class PixKeyDetailsController extends GetxController {
  final PixKeyBloc pixKeyBloc;
  PixKeyModel pixKeyDetails;

  PixKeyDetailsController({required this.pixKeyBloc, required this.pixKeyDetails});

  void onEdit() {
    Get.toNamed(AppRoutes.pixKeyForm, arguments: PixKeyFormParams(pixKeyEdit: pixKeyDetails))?.then((onValue) {
      if (onValue != null) {
        pixKeyDetails = onValue as PixKeyModel;
        update();
      }
    });
  }

  void onShare() async {
    await Share.share(formatPixKeyCopyAll(pixKeyDetails));
  }

  void onShowBottomSheetDeletePixKey() {
    Get.bottomSheet(DeletePixKeyConfirm(
      onDeletePixKey: _onDeletePixKey,
      onCancel: _onCancel,
    ));
  }

  void _onDeletePixKey() {
    pixKeyBloc.add(DeletePixKeyEvent(id: pixKeyDetails.id!));
  }

  void _onCancel() {
    Get.back();
  }
}

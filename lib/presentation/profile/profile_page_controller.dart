import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/usecases/logout_user.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_events.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_state.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class ProfilePageController extends GetxController {
  final LogoutUser _logoutUser;
  final PixKeysDeletedBloc pixKeysDeletedBloc;

  ProfilePageController(this._logoutUser, this.pixKeysDeletedBloc);

  final _pixKeysEmpty = false.obs;
  bool get pixKeysEmpty => _pixKeysEmpty.value;

  @override
  void onInit() {
    super.onInit();

    _loadParticipantsPix();
    _listenPixKeysDeletedBloc();
  }

  void _listenPixKeysDeletedBloc() {
    pixKeysDeletedBloc.stream.listen((state) {
      if (state is PixKeysDeletedSuccessState) {
        _pixKeysEmpty.value = state.pixKeys!.isEmpty;
        update();
      }
    });
  }

  void _loadParticipantsPix() {
    pixKeysDeletedBloc.add(LoadAllPixKeysDeletedEvent());
  }

  void onOpenAppSettings() async {
    await AppSettings.openAppSettings();
  }

  void onNavigateToTrashCan() {
    Get.toNamed(AppRoutes.trashCan)?.then((_) => _loadParticipantsPix());
  }

  void onLogout() async {
    await _logoutUser.call().then((_) => Get.offAllNamed(AppRoutes.login));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:pix_keeper/shared/widgets/banks_list.dart';

class HomePageController extends GetxController {
  final PixKeyBloc pixKeyBloc;

  HomePageController({required this.pixKeyBloc});

  @override
  void onInit() {
    super.onInit();

    _loadPixKeys();
  }

  @override
  void onClose() {
    pixKeyBloc.close();

    super.onClose();
  }

  void _loadPixKeys() {
    pixKeyBloc.add(LoadPixKeysEvent());
  }

  Future<void> onRefresh() {
    _loadPixKeys();

    return Future.value();
  }

  void onNavigateToDetails(PixKeyModel pixKey) {
    Get.toNamed(AppRoutes.pixKeyDetails, arguments: pixKey)?.then((_) => _loadPixKeys());
  }

  void onNavigateToForm() {
    Get.toNamed(AppRoutes.pixKeyForm)?.then((onValue) {
      if (onValue != null) {
        _loadPixKeys();
      }
    });
  }

  void onNavigateToProfile() {
    Get.toNamed(AppRoutes.profile);
  }

  void onShowBottomSheetBanks(PixKeyModel pixKey) {
    _showBottomSheetBanks(Get.context!, pixKey);
  }
}

void _showBottomSheetBanks(BuildContext context, PixKeyModel pixKey) {
  showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    context: Get.context!,
    builder: (context) {
      return Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            BanksList(pixKey: pixKey),
          ],
        ),
      );
    },
  );
}

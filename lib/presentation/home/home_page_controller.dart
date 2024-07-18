import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:pix_keeper/shared/widgets/banks_list.dart';

class HomePageController extends GetxController {
  final context = Get.context!;
  final user = FirebaseAuth.instance.currentUser;

  late final PixKeyBloc pixKeyBloc;

  Future<void> onRefresh() async {
    pixKeyBloc.add(LoadPixKeyEvent());
  }

  void onTapDetails(PixKeyModel pixKey) {
    Get.toNamed(AppRoutes.pixKeyDetails, arguments: pixKey)?.then((onValue) {
      pixKeyBloc.add(LoadPixKeyEvent());
    });
  }

  void onNavigateToForm() {
    Get.toNamed(AppRoutes.pixKeyForm)?.then((onValue) {
      if (onValue != null) {
        pixKeyBloc.add(LoadPixKeyEvent());
      }
    });
  }

  void onNavigateToProfile() {
    Get.toNamed(AppRoutes.profile, arguments: pixKeyBloc);
  }

  void onShowBottomSheetBanks(PixKeyModel pixKey) {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
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

  @override
  void onInit() {
    pixKeyBloc = PixKeyBloc();

    pixKeyBloc.add(LoadPixKeyEvent());

    super.onInit();
  }
}

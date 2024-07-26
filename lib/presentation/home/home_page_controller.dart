import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/data/models/pix_key_type.dart';
import 'package:pix_keeper/core/data/models/pix_key_type_option_model.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/core/utils/new_pix_key_params.dart';
import 'package:pix_keeper/presentation/home/widgets/add_copied_pix_key.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';
import 'package:pix_keeper/shared/utils/extensions/snack_bar_extension.dart';
import 'package:pix_keeper/shared/utils/extensions/string_extensions.dart';
import 'package:pix_keeper/shared/utils/format_mask.dart';
import 'package:pix_keeper/shared/utils/pix_key_types.dart';
import 'package:pix_keeper/shared/widgets/banks_list.dart';

class HomePageController extends GetxController {
  final PixKeyBloc pixKeyBloc;

  HomePageController({required this.pixKeyBloc});

  final _openBottomSheet = false.obs;
  final _pixKeyCopied = ''.obs;
  final _pixKeyTypeOptionModel = PixKeyTypeOptionModel().obs;

  @override
  void onInit() {
    super.onInit();

    _loadPixKeys();
    _handleClipboardData();
    _listenToPixKeyBloc();
  }

  void _listenToPixKeyBloc() {
    pixKeyBloc.stream.listen((state) {
      if (state is PixKeyLoadedState) {
        if (_pixKeyCopied.value.isNotEmpty) {
          final search = state.pixKeys
              ?.where((pixKey) => pixKey.key!.toLowerCase().contains(_pixKeyCopied.value.toLowerCase()))
              .toList();

          if (search!.isEmpty) {
            _onOpenBottomSheetAddCopiedPixKey();
          }
        }
      }
    });
  }

  void _onOpenBottomSheetAddCopiedPixKey() {
    Future.delayed(const Duration(seconds: 1), _showBottomSheetIfNeeded);
  }

  void _showBottomSheetIfNeeded() {
    if (_openBottomSheet.value) {
      _showBottomSheet().then((_) => _resetStateAfterBottomSheet());
    }
  }

  Future<void> _showBottomSheet() {
    return Get.bottomSheet(
      AddCopiedPixKey(
        keyText: _pixKeyCopied.value,
        pixKeyTypeLabel: _pixKeyTypeOptionModel.value.label!,
        onIgnored: _onIgnored,
        onAddPixKey: _onAddPixKey,
      ),
      isScrollControlled: true,
    );
  }

  void _resetStateAfterBottomSheet() {
    _openBottomSheet.value = false;
    _resetClipboard();
    update();
  }

  void _onAddPixKey() {
    Get.back();

    final arguments = PixKeyFormParams(
      pixKeyCopied: _pixKeyCopied.value,
      pixKeyTypeOption: _pixKeyTypeOptionModel.value,
    );

    onNavigateToForm(arguments);
  }

  void _onIgnored() {
    Get.back();
    _openBottomSheet.value = false;
    _pixKeyCopied.value = '';
    _pixKeyTypeOptionModel.value = PixKeyTypeOptionModel();
    update();
  }

  void _handleClipboardData() {
    Clipboard.getData('text/plain').then((value) {
      if (value != null && value.text != null) {
        final text = value.text!;

        if (GetUtils.isEmail(text)) {
          _pixKeyCopied.value = text;
          _pixKeyTypeOptionModel.value = _getPixKeyTypeOption(PixKeyType.email);
          _openBottomSheet.value = true;
          return;
        }

        if (text.isValidUuid()) {
          _pixKeyCopied.value = text;
          _pixKeyTypeOptionModel.value = _getPixKeyTypeOption(PixKeyType.random);
          _openBottomSheet.value = true;
          return;
        }

        if (GetUtils.isCpf(text.cleanText())) {
          _pixKeyCopied.value = FormatMask.maskCpf(text.cleanText());
          _pixKeyTypeOptionModel.value = _getPixKeyTypeOption(PixKeyType.cpf);
          _openBottomSheet.value = true;
          return;
        }

        if (GetUtils.isCnpj(text.cleanText())) {
          _pixKeyCopied.value = FormatMask.maskCnpj(text.cleanText());
          _pixKeyTypeOptionModel.value = _getPixKeyTypeOption(PixKeyType.cnpj);
          _openBottomSheet.value = true;
          return;
        }

        if (GetUtils.isPhoneNumber(text.cleanText())) {
          _pixKeyCopied.value = FormatMask.maskPhone(text.cleanText());
          _pixKeyTypeOptionModel.value = _getPixKeyTypeOption(PixKeyType.phone);
          _openBottomSheet.value = true;
          return;
        }
      }
    });
  }

  void _resetClipboard() {
    Clipboard.setData(const ClipboardData(text: ''));
  }

  PixKeyTypeOptionModel _getPixKeyTypeOption(PixKeyType pixKeyType) {
    return pixKeyTypes.firstWhere((p) => p.pixKeyType == pixKeyType);
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

  void onNavigateToForm([PixKeyFormParams? params]) {
    Get.toNamed(AppRoutes.pixKeyForm, arguments: params)?.then((onValue) {
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

  void showSnackBarDeletePixKeySuccess(String pixKeyId) {
    Get.showCustomSnackbar(
      message: 'Chave Pix deletada com sucesso!',
      mainButton: TextButton(
        onPressed: () => onRestorePixKey(pixKeyId),
        child: const Text("Desfazer"),
      ),
    );
  }

  void showSnackBarRestorePixKeySuccess() {
    Get.showCustomSnackbar(message: 'Chave Pix restaurada com sucesso!');
  }

  void onRestorePixKey(String pixKeyId) {
    pixKeyBloc.add(RestorePixKeyEvent(id: pixKeyId));
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/copy_pix_key.dart';
import 'package:pix_keeper/shared/utils/format_copy_key_pix.dart';
import 'package:pix_keeper/shared/utils/get_value_unmask.dart';

class CopyController extends GetxController {
  late final CopyPixKey copyPixKey;

  final _id = ''.obs;

  String get id => _id.value;

  IconData icon(PixKeyModel pixKey, {isCopyAll = false}) {
    if (pixKey.id == id) {
      return Icons.check;
    } else {
      return isCopyAll ? Icons.copy_all : Icons.copy;
    }
  }

  _setSelectedId(String text) async {
    _id(text);
    update();

    await Future.delayed(const Duration(seconds: 3));
    _id('');
    update();
  }

  void copyKeyPixAll(PixKeyModel pixKey) async {
    _setSelectedId(pixKey.id!);
    await Clipboard.setData(ClipboardData(text: formatCopyKeyPix(pixKey)));
  }

  void copyText(PixKeyModel pixKey) async {
    _setSelectedId(pixKey.id!);
    final unmaskValue = getValueUnmask(pixKey.pixKeyType!, pixKey.key!);

    Future.wait([
      Clipboard.setData(ClipboardData(text: unmaskValue)),
      copyPixKey.call(pixKey.id!),
    ]);
  }

  @override
  void onInit() {
    copyPixKey = CopyPixKey(repository: PixKeysRepositoryImpl());
    super.onInit();
  }
}

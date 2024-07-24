import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/domain/usecases/copy_and_open_bank.dart';
import 'package:pix_keeper/core/domain/usecases/copy_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/copy_text.dart';
import 'package:pix_keeper/shared/utils/format_pix_key_copy_all.dart';
import 'package:pix_keeper/shared/utils/get_unmask_value.dart';

class CopyController extends GetxController {
  final CopyText _copyText;
  final CopyPixKey _copyPixKey;
  final CopyAndOpenAppBank _copyAndOpenAppBank;

  CopyController({
    required CopyText copyText,
    required CopyPixKey copyPixKey,
    required CopyAndOpenAppBank copyAndOpenAppBank,
  })  : _copyText = copyText,
        _copyPixKey = copyPixKey,
        _copyAndOpenAppBank = copyAndOpenAppBank;

  final _id = ''.obs;
  String get id => _id.value;

  IconData icon(PixKeyModel pixKey, {isCopyAll = false}) {
    if (pixKey.id == id) {
      return Icons.check;
    } else {
      return isCopyAll ? Icons.copy_all : Icons.copy;
    }
  }

  void _clearId() {
    _id.value = '';
    update();
  }

  void _updateId(String text) {
    _id.value = text;
    update();
  }

  Future<void> _setSelectedId(String text) async {
    _updateId(text);
    await Future.delayed(const Duration(seconds: 3));
    _clearId();
  }

  void onCopyAll(PixKeyModel pixKey) async {
    _setSelectedId(pixKey.id!);
    await _copyText.call(formatPixKeyCopyAll(pixKey));
  }

  Future<void> onCopy(PixKeyModel pixKey) async {
    _setSelectedId(pixKey.id!);

    final unmaskValue = getUnmaskValue(pixKey.pixKeyType!, pixKey.key!);

    Future.wait([
      _copyText.call(unmaskValue),
      _copyPixKey.call(pixKey.id!),
    ]);
  }

  void onCopyAndOpenAppBank(String packageName, PixKeyModel pixKey) async {
    _setSelectedId(pixKey.id!);

    final unmaskValue = getUnmaskValue(pixKey.pixKeyType!, pixKey.key!);

    Future.wait([
      _copyText.call(unmaskValue),
      _copyAndOpenAppBank.call(packageName, pixKey),
    ]);
  }
}

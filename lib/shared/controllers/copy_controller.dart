import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/utils/format_copy_key_pix.dart';
import 'package:pix_keeper/shared/utils/get_key_pix_type.dart';
import 'package:pix_keeper/shared/utils/get_value_unmask.dart';

class CopyController extends GetxController {
  final _text = ''.obs;

  String get text => _text.value;

  IconData icon(String value, {isCopyAll = false}) {
    if (value == text) {
      return Icons.check;
    } else {
      return isCopyAll ? Icons.copy_all : Icons.copy;
    }
  }

  _setSelectedUid(String text) async {
    _text(text);
    update();

    await Future.delayed(const Duration(seconds: 3));
    _text('');
    update();
  }

  void copyKeyPixAll(PixKeyModel pixKey) async {
    _setSelectedUid(pixKey.id!.toString());
    await Clipboard.setData(ClipboardData(text: formatCopyKeyPix(pixKey)));
  }

  void copyText(String text) async {
    _setSelectedUid(text);
    final pixKeyType = getKeyPixType(text);
    final unmaskValue = getValueUnmask(pixKeyType, text);

    await Clipboard.setData(ClipboardData(text: unmaskValue.replaceAll('_', '')));
  }
}

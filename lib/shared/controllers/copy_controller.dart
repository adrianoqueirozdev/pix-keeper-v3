import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/utils/format_copy_key_pix.dart';
import 'package:pix_keeper/shared/utils/get_key_pix_type.dart';
import 'package:pix_keeper/shared/utils/get_value_unmask.dart';

class CopyController extends GetxController {
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
    final pixKeyType = getPixKeyType(pixKey.pixKeyType!);
    final unmaskValue = getValueUnmask(pixKeyType, pixKey.key!);

    await Clipboard.setData(ClipboardData(text: unmaskValue));
  }
}

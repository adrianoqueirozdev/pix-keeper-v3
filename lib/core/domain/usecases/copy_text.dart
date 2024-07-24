import 'package:flutter/services.dart';

class CopyText {
  Future<void> call(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}

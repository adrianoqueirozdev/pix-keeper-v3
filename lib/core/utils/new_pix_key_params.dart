import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/data/models/pix_key_type_option_model.dart';

class PixKeyFormParams {
  final String? pixKeyCopied;
  final PixKeyTypeOptionModel? pixKeyTypeOption;
  final PixKeyModel? pixKeyEdit;

  PixKeyFormParams({this.pixKeyCopied, this.pixKeyTypeOption, this.pixKeyEdit});
}

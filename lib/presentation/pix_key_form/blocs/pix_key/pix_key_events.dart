import 'package:pix_keeper/core/data/models/pix_key.dart';

abstract class PixKeyEvents {}

class CreatePixKeyEvent extends PixKeyEvents {
  final PixKeyModel pixKeyModel;

  CreatePixKeyEvent(this.pixKeyModel);
}

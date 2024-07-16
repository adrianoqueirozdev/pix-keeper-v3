import 'package:pix_keeper/core/data/models/pix_key.dart';

abstract class PixKeyEvents {
  PixKeyModel? pixKeyModel;

  PixKeyEvents({this.pixKeyModel});
}

class LoadPixKeyEvent extends PixKeyEvents {}

class CreatePixKeyEvent extends PixKeyEvents {
  CreatePixKeyEvent({required super.pixKeyModel});
}

class UpdatePixKeyEvent extends PixKeyEvents {
  UpdatePixKeyEvent({required super.pixKeyModel});
}

class DeletePixKeyEvent extends PixKeyEvents {
  final String id;

  DeletePixKeyEvent(this.id);
}

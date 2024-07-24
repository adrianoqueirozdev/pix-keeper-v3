import 'package:pix_keeper/core/data/models/pix_key_model.dart';

abstract class PixKeyEvent {}

class LoadPixKeysEvent extends PixKeyEvent {}

class CreatePixKeyEvent extends PixKeyEvent {
  final PixKeyModel pixKeyModel;

  CreatePixKeyEvent({required this.pixKeyModel});
}

class UpdatePixKeyEvent extends PixKeyEvent {
  final PixKeyModel pixKeyModel;

  UpdatePixKeyEvent({required this.pixKeyModel});
}

class DeletePixKeyEvent extends PixKeyEvent {
  final String id;

  DeletePixKeyEvent({required this.id});
}

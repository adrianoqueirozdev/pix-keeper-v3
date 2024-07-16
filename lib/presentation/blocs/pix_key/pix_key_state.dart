import 'package:pix_keeper/core/data/models/pix_key.dart';

abstract class PixKeyState {
  List<PixKeyModel>? pixKeys = [];
  PixKeyModel? pixKey;

  PixKeyState({this.pixKeys, this.pixKey});
}

class PixKeyInitialState extends PixKeyState {
  PixKeyInitialState() : super(pixKeys: []);
}

class PixKeyLoadedState extends PixKeyState {
  PixKeyLoadedState({required super.pixKeys});
}

// -----------------------------------------------------------------------------
// CREATE PIX KEY
// -----------------------------------------------------------------------------
class CreatePixKeyLoadingState extends PixKeyState {}

class CreatePixKeySuccessState extends PixKeyState {
  CreatePixKeySuccessState({required super.pixKey});
}

// -----------------------------------------------------------------------------
// UPDATE PIX KEY
// -----------------------------------------------------------------------------
class UpdatePixKeyLoadingState extends PixKeyState {}

class UpdatePixKeySuccessState extends PixKeyState {
  UpdatePixKeySuccessState({required super.pixKey});
}

// -----------------------------------------------------------------------------
// DELETE PIX KEY
// -----------------------------------------------------------------------------
class DeletePixKeyLoadingState extends PixKeyState {}

class DeletePixKeySuccessState extends PixKeyState {}

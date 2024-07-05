import 'package:pix_keeper/core/data/models/pix_key.dart';

abstract class PixKeyState {
  List<PixKeyModel> pixKeys;

  PixKeyState({required this.pixKeys});
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
class CreatePixKeyLoadingState extends PixKeyState {
  CreatePixKeyLoadingState({required super.pixKeys});
}

class CreatePixKeySuccessState extends PixKeyState {
  CreatePixKeySuccessState({required super.pixKeys});
}

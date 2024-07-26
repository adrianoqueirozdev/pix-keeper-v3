import 'package:pix_keeper/core/data/models/pix_key_model.dart';

abstract class PixKeyState {
  List<PixKeyModel>? pixKeys = [];
  PixKeyModel? pixKey;
  String? error;

  PixKeyState({this.pixKeys, this.pixKey, this.error});
}

class PixKeyInitialState extends PixKeyState {
  PixKeyInitialState() : super(pixKeys: []);
}

class PixKeyLoadedState extends PixKeyState {
  PixKeyLoadedState({required super.pixKeys});
}

// CREATE PIX KEY
class CreatePixKeyLoadingState extends PixKeyState {}

class CreatePixKeySuccessState extends PixKeyState {
  CreatePixKeySuccessState({required super.pixKey});
}

class CreatePixKeyErrorState extends PixKeyState {
  CreatePixKeyErrorState({required super.error});
}

// UPDATE PIX KEY
class UpdatePixKeyLoadingState extends PixKeyState {}

class UpdatePixKeySuccessState extends PixKeyState {
  UpdatePixKeySuccessState({required super.pixKey});
}

class UpdatePixKeyErrorState extends PixKeyState {
  UpdatePixKeyErrorState({required super.error});
}

// DELETE PIX KEY
class DeletePixKeyLoadingState extends PixKeyState {}

class DeletePixKeySuccessState extends PixKeyState {
  final String id;

  DeletePixKeySuccessState({required this.id});
}

class DeletePixKeyErrorState extends PixKeyState {
  DeletePixKeyErrorState({required super.error});
}

// RESTORE PIX KEY
class RestorePixKeyLoadingState extends PixKeyState {}

class RestorePixKeySuccessState extends PixKeyState {}

class RestorePixKeyErrorState extends PixKeyState {
  RestorePixKeyErrorState({required super.error});
}

// GENERAL ERROR
class PixKeyErrorState extends PixKeyState {
  PixKeyErrorState({required super.error});
}

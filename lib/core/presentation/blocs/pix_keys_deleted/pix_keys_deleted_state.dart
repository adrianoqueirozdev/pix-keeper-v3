import 'package:pix_keeper/core/data/models/pix_key_model.dart';

abstract class PixKeysDeletedState {
  List<PixKeyModel>? pixKeys = [];
  String? error;

  PixKeysDeletedState({this.pixKeys, this.error});
}

class PixKeysDeletedInitialState extends PixKeysDeletedState {}

class PixKeysDeletedSuccessState extends PixKeysDeletedState {
  PixKeysDeletedSuccessState({required super.pixKeys});
}

class PixKeysDeletedErrorState extends PixKeysDeletedState {
  PixKeysDeletedErrorState({required super.error});
}

class EmptyTheTrashCanSuccessState extends PixKeysDeletedState {}

class EmptyTheTrashCanErrorState extends PixKeysDeletedState {
  EmptyTheTrashCanErrorState({required super.error});
}

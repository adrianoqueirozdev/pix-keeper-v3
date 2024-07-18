import 'package:pix_keeper/core/data/models/pix_key.dart';

abstract class PixKeysDeletedState {
  List<PixKeyModel>? pixKeys = [];

  PixKeysDeletedState({this.pixKeys});
}

class PixKeysDeletedInitialState extends PixKeysDeletedState {}

class PixKeysDeletedSuccessState extends PixKeysDeletedState {
  PixKeysDeletedSuccessState({required super.pixKeys});
}

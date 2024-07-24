import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/domain/usecases/copy_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/open_app.dart';

class CopyAndOpenAppBank {
  final CopyPixKey _copyPixKey;
  final OpenApp _openApp;

  CopyAndOpenAppBank({
    required CopyPixKey copyPixKey,
    required OpenApp openApp,
  })  : _copyPixKey = copyPixKey,
        _openApp = openApp;

  Future<void> call(String packageName, PixKeyModel pixKey) async {
    Future.wait([
      _copyPixKey.call(pixKey.id!),
      _openApp.call(packageName),
    ]);
  }
}

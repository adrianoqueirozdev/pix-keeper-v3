import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/utils/get_key_pix_type.dart';
import 'package:pix_keeper/shared/utils/get_value_unmask.dart';

String formatCopyKeyPix(PixKeyModel pixKey) {
  final favoredName = pixKey.favoredName;
  final institution = pixKey.institution;
  final keyPix = pixKey.key;
  final pixKeyType = getKeyPixType(keyPix!);
  final unmaskValue = getValueUnmask(pixKeyType, keyPix);

  final favoredNameStr =
      favoredName != null && favoredName.isNotEmpty ? "NOME DO FAVORECIDO: ${favoredName.toUpperCase()}\n" : "";
  final institutionStr =
      institution != null && institution.isNotEmpty ? "INSTITUIÇÃO: ${institution.toUpperCase()}\n" : "";

  final text = "PIX KEEPER\n\n"
      "NOME: ${pixKey.name!.toUpperCase()}\n"
      "$favoredNameStr"
      "$institutionStr"
      "TIPO DE CHAVE: ${pixKey.pixKeyType!.toUpperCase()}\n"
      "CHAVE PIX: $unmaskValue\n";

  return text;
}

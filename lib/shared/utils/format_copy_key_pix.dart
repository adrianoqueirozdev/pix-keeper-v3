import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/utils/get_value_unmask.dart';

String formatCopyKeyPix(PixKeyModel pixKey) {
  String formatField(String label, String? value) {
    return value != null && value.isNotEmpty ? "$label: ${value.toUpperCase()}\n" : "";
  }

  final favoredNameStr = formatField("NOME DO FAVORECIDO", pixKey.favoredName);
  final institutionStr = formatField("INSTITUIÇÃO", pixKey.institutionShortName);
  final unmaskValue = getValueUnmask(pixKey.pixKeyType!, pixKey.key!);

  final text = StringBuffer()
    ..writeln("PIX KEEPER\n")
    ..writeln("NOME: ${pixKey.name!.toUpperCase()}")
    ..write(favoredNameStr)
    ..write(institutionStr)
    ..writeln("TIPO DE CHAVE: ${pixKey.pixKeyTypeLabel!.toUpperCase()}")
    ..writeln("CHAVE PIX: $unmaskValue");

  return text.toString();
}

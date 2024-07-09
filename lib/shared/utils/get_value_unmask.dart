import 'package:brasil_fields/brasil_fields.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';

String getValueUnmask(PixKeyType type, String value) => switch (type) {
      PixKeyType.cpf => UtilBrasilFields.removeCaracteres(value),
      PixKeyType.cnpj => UtilBrasilFields.removeCaracteres(value),
      PixKeyType.phone => UtilBrasilFields.obterTelefone(value, mascara: false),
      _ => value,
    };

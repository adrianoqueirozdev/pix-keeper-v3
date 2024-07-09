import 'package:pix_keeper/core/data/models/pix_key.dart';

PixKeyType getPixKeyType(String type) => switch (type) {
      "email" => PixKeyType.email,
      "phone" => PixKeyType.phone,
      "cpf" => PixKeyType.cpf,
      "cnpj" => PixKeyType.cnpj,
      "random" => PixKeyType.random,
      _ => PixKeyType.none,
    };

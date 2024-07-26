import 'package:pix_keeper/core/data/models/pix_key_type.dart';
import 'package:pix_keeper/core/data/models/pix_key_type_option_model.dart';

List<PixKeyTypeOptionModel> pixKeyTypes = [
  PixKeyTypeOptionModel(
    pixKeyType: PixKeyType.email,
    label: "E-mail",
  ),
  PixKeyTypeOptionModel(
    pixKeyType: PixKeyType.phone,
    label: "Telefone",
  ),
  PixKeyTypeOptionModel(
    pixKeyType: PixKeyType.cpf,
    label: "CPF",
  ),
  PixKeyTypeOptionModel(
    pixKeyType: PixKeyType.cnpj,
    label: "CNPJ",
  ),
  PixKeyTypeOptionModel(
    pixKeyType: PixKeyType.random,
    label: "Chave Aleatória",
  ),
];

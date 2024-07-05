import 'package:pix_keeper/core/data/models/pix_key.dart';

List<PixKeyTypeOption> getKeyPixTypeOptions() {
  return [
    PixKeyTypeOption(
      pixKeyType: PixKeyType.email,
      label: "E-mail",
    ),
    PixKeyTypeOption(
      pixKeyType: PixKeyType.phone,
      label: "Telefone",
    ),
    PixKeyTypeOption(
      pixKeyType: PixKeyType.cpf,
      label: "CPF",
    ),
    PixKeyTypeOption(
      pixKeyType: PixKeyType.cnpj,
      label: "CNPJ",
    ),
    PixKeyTypeOption(
      pixKeyType: PixKeyType.random,
      label: "Chave Aleatória",
    ),
  ];
}

import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/utils/validate_uuid.dart';

const _empty = "Campo obrigatório";

class ValidationPixKeyForm {
  ValidationPixKeyForm._();

  static String? validateName(String? text) {
    if (text!.isEmpty) return _empty;

    return null;
  }

  static String? validateKeyPixType(PixKeyTypeOption? value) {
    if (value!.pixKeyType == null || value.label == null) return _empty;

    return null;
  }

  static String? validateKeyPix(String? text, PixKeyType pixKeyType) {
    if (text!.isEmpty) return _empty;

    switch (pixKeyType) {
      case PixKeyType.cpf:
        if (!GetUtils.isCpf(text)) return "CPF inválido";
        break;
      case PixKeyType.cnpj:
        if (!GetUtils.isCnpj(text)) return "CNPJ inválido";
        break;
      case PixKeyType.phone:
        if (!GetUtils.isPhoneNumber(text)) return "Telefone inválido";
        break;
      case PixKeyType.email:
        if (!GetUtils.isEmail(text)) return "E-mail inválido";
        break;
      case PixKeyType.random:
        if (!validateUuid(text)) return "Chave aleatória inválida";
        break;
      default:
        return null;
    }
    return null;
  }
}

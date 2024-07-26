import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_type.dart';
import 'package:pix_keeper/core/data/models/pix_key_type_option_model.dart';
import 'package:pix_keeper/shared/utils/extensions/string_extensions.dart';

const _empty = "Campo obrigatório";

class ValidationPixKeyForm {
  ValidationPixKeyForm._();

  static String? validateName(String? text) {
    if (text!.isEmpty) return _empty;

    return null;
  }

  static String? validateKeyPixType(PixKeyTypeOptionModel? value) {
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
        if (!text.isValidUuid()) return "Chave aleatória inválida";
        break;
      default:
        return null;
    }
    return null;
  }
}

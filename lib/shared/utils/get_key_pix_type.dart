import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/shared/utils/validate_uuid.dart';

PixKeyType getKeyPixType(String keyPix) {
  if (GetUtils.isEmail(keyPix)) {
    return PixKeyType.email;
  } else if (GetUtils.isCpf(keyPix)) {
    return PixKeyType.cpf;
  } else if (GetUtils.isPhoneNumber(keyPix)) {
    return PixKeyType.phone;
  } else if (GetUtils.isCnpj(keyPix)) {
    return PixKeyType.cnpj;
  } else if (validateUuid(keyPix)) {
    return PixKeyType.random;
  } else {
    return PixKeyType.none;
  }
}

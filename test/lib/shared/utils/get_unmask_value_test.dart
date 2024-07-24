import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/config/logger_config.dart';
import 'package:pix_keeper/core/data/models/pix_key_type.dart';
import 'package:pix_keeper/shared/utils/get_unmask_value.dart';

void main() {
  test('should return correct unmask value', () {
    expect(getUnmaskValue(PixKeyType.cpf, '123.456.789-01'), '12345678901');
    expect(getUnmaskValue(PixKeyType.cnpj, '12.345.678/0001-90'), '12345678000190');
    expect(getUnmaskValue(PixKeyType.phone, '(11) 99999-9999'), '11999999999');

    logger.d("get_unmask_value_test: [Unmask values are correct]");
  });
}

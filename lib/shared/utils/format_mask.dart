sealed class FormatMask {
  static String maskCpf(String cpf) {
    return cpf.replaceAllMapped(
      RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'),
      (match) => '${match[1]}.${match[2]}.${match[3]}-${match[4]}',
    );
  }

  static String maskCnpj(String cnpj) {
    return cnpj.replaceAllMapped(
      RegExp(r'(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})'),
      (match) => '${match[1]}.${match[2]}.${match[3]}/${match[4]}-${match[5]}',
    );
  }

  static String maskPhone(String phone) {
    return phone.replaceAllMapped(
      RegExp(r'(\d{2})(\d{5})(\d{4})'),
      (match) => '(${match[1]}) ${match[2]}-${match[3]}',
    );
  }
}

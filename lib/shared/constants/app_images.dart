sealed class AppImages {
  static const String iconGoogle = 'lib/resources/icons/icon-google.png';
  static const String logoPrimary = 'lib/resources/icons/launch-icon.png';
  static const String logoQr = 'lib/resources/images/logo-qr.png';

  static const String empty = 'lib/resources/images/empty.svg';
  static const String intro1 = 'lib/resources/images/intro-1.svg';
  static const String intro2 = 'lib/resources/images/intro-2.svg';
  static const String intro3 = 'lib/resources/images/intro-3.svg';
  static const String error = 'lib/resources/images/error.svg';
  static const String fingerprint = 'lib/resources/images/fingerprint.svg';
  static const String backgroundKeysPix = 'lib/resources/images/background-keys-pix.svg';
  static const String logoDefault = 'lib/resources/images/logo-default.svg';
  static const String logoVariant = 'lib/resources/images/logo-variant.svg';
  static const String bug = 'lib/resources/images/bug.svg';
  static const String delete = 'lib/resources/images/delete.svg';

  static const String caixa = 'lib/resources/images/caixa.png';
  static const String itau = 'lib/resources/images/itau.png';
  static const String nubank = 'lib/resources/images/nubank.png';
  static const String inter = 'lib/resources/images/inter.png';
  static const String mp = 'lib/resources/images/mp.png';

  static String keysLogo(bool isDarkMode) => isDarkMode ? logoDefault : logoVariant;
}

class Environments {
  Environments._();

  static String brasilApiUrl = const String.fromEnvironment('BRASIL_API_BASE_URL');

  static String appName = const String.fromEnvironment('APP_NAME');
  static String firebaseApiKey = const String.fromEnvironment('FIREBASE_API_KEY');
  static String firebaseAppId = const String.fromEnvironment('FIREBASE_APP_ID');
  static String firebaseMessagingSenderId = const String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static String firebaseProjectId = const String.fromEnvironment('FIREBASE_PROJECT_ID');
  static String firebaseStorageBucket = const String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
}

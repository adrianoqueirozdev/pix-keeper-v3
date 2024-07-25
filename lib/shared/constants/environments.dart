import 'package:pix_keeper/shared/constants/environment_variable_names.dart';

sealed class Environments {
  static String brasilApiUrl = const String.fromEnvironment(EnvironmentVariableNames.brasilApiUrl);

  static String appName = const String.fromEnvironment(EnvironmentVariableNames.appName);
  static String appVersion = const String.fromEnvironment(EnvironmentVariableNames.appVersion);
  static String firebaseApiKey = const String.fromEnvironment(EnvironmentVariableNames.firebaseApiKey);
  static String firebaseAppId = const String.fromEnvironment(EnvironmentVariableNames.firebaseAppId);
  static String firebaseMessagingSenderId =
      const String.fromEnvironment(EnvironmentVariableNames.firebaseMessagingSenderId);
  static String firebaseProjectId = const String.fromEnvironment(EnvironmentVariableNames.firebaseProjectId);
  static String firebaseStorageBucket = const String.fromEnvironment(EnvironmentVariableNames.firebaseStorageBucket);
}

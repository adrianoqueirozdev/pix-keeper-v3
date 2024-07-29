import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/shared/constants/environment_variable_names.dart';

void main() {
  test('should return correct environment variable names', () {
    expect(EnvironmentVariableNames.brasilApiUrl, 'BRASIL_API_BASE_URL');
    expect(EnvironmentVariableNames.appName, 'APP_NAME');
    expect(EnvironmentVariableNames.appVersion, 'APP_VERSION');
    expect(EnvironmentVariableNames.firebaseApiKey, 'FIREBASE_API_KEY');
    expect(EnvironmentVariableNames.firebaseAppId, 'FIREBASE_APP_ID');
    expect(EnvironmentVariableNames.firebaseMessagingSenderId, 'FIREBASE_MESSAGING_SENDER_ID');
    expect(EnvironmentVariableNames.firebaseProjectId, 'FIREBASE_PROJECT_ID');
    expect(EnvironmentVariableNames.firebaseStorageBucket, 'FIREBASE_STORAGE_BUCKET');
  });
}

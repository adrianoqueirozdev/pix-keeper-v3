import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/config/logger_config.dart';

import 'firebase_mock.dart';

void main() {
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  test('should return correct firebase config', () {
    expect(Firebase.apps.length, 1);
    logger.d("firebase_config_test: [Firebase initialized with ${Firebase.apps.length} apps]");
  });
}

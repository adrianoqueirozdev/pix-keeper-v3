import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/shared/constants/firebase_collections.dart';

void main() {
  test('should return correct firebase collections', () {
    expect(FirebaseCollections.users, 'users');
    expect(FirebaseCollections.pixKeys, 'pix_keys');
  });
}

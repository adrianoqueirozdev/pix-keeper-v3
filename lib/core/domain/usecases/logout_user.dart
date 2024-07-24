import 'package:firebase_auth/firebase_auth.dart';

class LogoutUser {
  final FirebaseAuth _firebaseAuth;

  LogoutUser({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  Future<void> call() async {
    await _firebaseAuth.signOut();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = Get.find<FirebaseAuth>();

  @override
  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();

  final FirebaseAuth _firebaseAuth = Get.find<FirebaseAuth>();

  UserManager._internal();

  factory UserManager() {
    return _instance;
  }

  String? get userId => _firebaseAuth.currentUser?.uid;

  User? get user => _firebaseAuth.currentUser;
}

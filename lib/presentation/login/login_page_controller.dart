import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class LoginPageController extends GetxController {
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void login() async {
    _isLoading.value = true;
    update();

    final credential = await signInWithGoogle();
    _isLoading.value = false;

    if (credential.user != null) {
      Get.offNamed(AppRoutes.home);
    }
  }
}

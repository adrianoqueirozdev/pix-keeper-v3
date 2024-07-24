import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pix_keeper/shared/constants/environments.dart';

class FirebaseConfig {
  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      name: "pix-keeper-v2",
      options: FirebaseOptions(
        apiKey: Environments.firebaseApiKey,
        appId: Environments.firebaseAppId,
        messagingSenderId: Environments.firebaseMessagingSenderId,
        projectId: Environments.firebaseProjectId,
      ),
    );

    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }
}

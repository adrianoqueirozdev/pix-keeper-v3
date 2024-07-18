import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pix_keeper/app.dart';
import 'package:pix_keeper/shared/constants/environments.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Animate.restartOnHotReload = true;

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

  runApp(const App());
}

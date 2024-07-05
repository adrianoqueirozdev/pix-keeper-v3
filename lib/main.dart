import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pix_keeper/app.dart';
import 'package:pix_keeper/shared/constants/environments.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "pix-keeper-v2",
    options: FirebaseOptions(
      apiKey: Environments.firebaseApiKey,
      appId: Environments.firebaseAppId,
      messagingSenderId: Environments.firebaseMessagingSenderId,
      projectId: Environments.firebaseProjectId,
    ),
  );

  runApp(const App());
}

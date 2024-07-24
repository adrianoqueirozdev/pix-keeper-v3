import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pix_keeper/app.dart';
import 'package:pix_keeper/config/dependency_injection.dart';
import 'package:pix_keeper/config/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Animate.restartOnHotReload = true;

  // Initialize Firebase
  await FirebaseConfig.initializeFirebase();

  // Initialize Dependency Injection
  DependencyInjection.init();

  runApp(const App());
}

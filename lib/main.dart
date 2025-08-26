import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quotely/pages/home_screen.dart';
import 'package:quotely/theme/app_theme.dart';
// Import Firebase Core
import 'firebase_options.dart'; // Import the generated file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const Homescreen(),
    );
  }
}

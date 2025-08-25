import 'package:flutter/material.dart';
import 'package:quotely/pages/home_screen.dart';
import 'package:quotely/theme/app_theme.dart';

void main() {
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

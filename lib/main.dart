// Created by 2004Ahmed - حقوقي
import 'package:flutter/material.dart';
import 'auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MenbrApp());
}

class MenbrApp extends StatelessWidget {
  const MenbrApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menbr',
      theme: ThemeData.dark(),
      home: const AuthScreen(), // شاشة الدخول
      debugShowCheckedModeBanner: false,
    );
  }
}

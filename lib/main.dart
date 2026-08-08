// Created by 2004ahmed - حقوقي
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_screen.dart'; // اضفنا دي

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MenbrApp());
}

class MenbrApp extends StatelessWidget {
  const MenbrApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menbr',
      theme: ThemeData.dark(),
      home: const AuthScreen(), // غيرناها من Scaffold
      debugShowCheckedModeBanner: false,
    );
  }
}

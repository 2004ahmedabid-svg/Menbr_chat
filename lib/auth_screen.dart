import 'package:flutter/material.dart';
import 'chat_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ChatScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menbr Chat')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'الايميل')),
          const SizedBox(height: 10),
          TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'كلمة السر'), obscureText: true),
          const SizedBox(height: 20),
          _isLoading? const CircularProgressIndicator() : Column(children: [
            ElevatedButton(onPressed: _login, child: const Text('دخول')),
            TextButton(onPressed: _login, child: const Text('تسجيل حساب جديد')),
          ]),
        ]),
      ),
    );
  }
}

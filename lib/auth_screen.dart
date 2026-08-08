import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();
  bool _isLogin = true;

  void _submit() async {
    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), 
          password: _password.text.trim()
        );
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), 
          password: _password.text.trim()
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_isLogin ? 'تسجيل دخول' : 'انشاء حساب')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if(!_isLogin) TextField(controller: _username, decoration: InputDecoration(labelText: 'المعرف @ بدون ارقام')),
            TextField(controller: _email, decoration: InputDecoration(labelText: 'الايميل')),
            TextField(controller: _password, obscureText: true, decoration: InputDecoration(labelText: 'كلمة السر')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: Text(_isLogin ? 'دخول' : 'تسجيل')),
            TextButton(onPressed: () => setState(() => _isLogin = !_isLogin), child: Text(_isLogin ? 'ماعندك حساب؟ سجل' : 'عندك حساب؟ سجل دخول'))
          ],
        ),
      ),
    );
  }
}

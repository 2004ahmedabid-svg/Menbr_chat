import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> _login() async {
    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ChatScreen()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'خطأ')));
    }
    setState(() => _isLoading = false);
  }

  Future<void> _register() async {
    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(), 
        password: _passwordController.text.trim());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ChatScreen()));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? 'خطأ')));
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menbr Chat')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'الايميل')),
          SizedBox(height: 10),
          TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'كلمة السر'), obscureText: true),
          SizedBox(height: 20),
          _isLoading ? CircularProgressIndicator() : Column(children: [
            ElevatedButton(onPressed: _login, child: Text('دخول')),
            TextButton(onPressed: _register, child: Text('تسجيل حساب جديد')),
          ]),
        ]),
      ),
    );
  }
}

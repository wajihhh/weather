import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/toast.dart';
import '../services/authservice.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();
  bool _isSending = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email address to reset your password',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isSending ? null : _sendPasswordResetEmail,
              child: _isSending
                  ? const CircularProgressIndicator(
                color: Colors.white,
              )
                  : const Text('Send Reset Email'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendPasswordResetEmail() async {
    setState(() {
      _isSending = true;
    });

    try {
      await _authService.sendPasswordResetEmail(_emailController.text.trim());
      showToast(message: 'Password reset email sent');
    } catch (e) {
      showToast(message: 'Error: ${e.toString()}');
    }

    setState(() {
      _isSending = false;
    });
  }
}

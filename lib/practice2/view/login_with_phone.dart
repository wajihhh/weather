import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../chat/services/auth_service.dart';
import '../../widgets/round_button.dart';
import '../services/authservice.dart';

class LoginWithPhoneNumber extends StatelessWidget {
  final phoneNumberController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  LoginWithPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: '+1 234 3455 234'),
            ),
            const SizedBox(height: 80),
            Obx(() => RoundButton(
              title: 'Login',
              loading: _auth.isPhoneAuth.value,
              onTap: () {
                _auth.signInWithPhoneNumber(phoneNumberController.text);
              },
            )),
          ],
        ),
      ),
    );
  }
}

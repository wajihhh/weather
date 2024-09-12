import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/snackbar.dart';
import '../services/authservice.dart';
import 'home.dart';

class SignupScreen1 extends StatefulWidget {
  const SignupScreen1({super.key});

  @override
  State<SignupScreen1> createState() => _SignupScreen1State();
}

class _SignupScreen1State extends State<SignupScreen1> {
  final Authservice1 _auth = Authservice1();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    final res = await Authservice1().signUpUser(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
    );
    //if signup success, navigate to next screen, otherwise show error

    if (res == 'success') {
      setState(() {
        isLoading = true;
      });
      print("Success");
      //navigate to the next screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen1()));
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    } else {
      print("error");
      setState(() {
        isLoading = true;
      });
      //show error message
      showSnackbar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: "Name"),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "Email.."),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: signUpUser,
              child: const Text(
                "Sign Up",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

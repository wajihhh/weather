import 'package:firebase_cli/practice2/services/authservice.dart';
import 'package:firebase_cli/practice2/view/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({super.key, this.child});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    // _checkAuthenticationAndNavigate();
    splashServices.isLogin(BuildContext, context);
  }

  // void _checkAuthenticationAndNavigate() async {
  //   await Future.delayed(Duration(seconds: 3));
  //
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;
  //   bool rememberMe = await _authService.isRememberMeEnabled();
  //   bool isGoogleSignIn = await _authService.isGoogleSignIn();
  //
  //
  //
  //   if ((rememberMe || isGoogleSignIn) && user != null) {
  //     Get.offAllNamed('/home');
  //   } else {
  //     Get.offAllNamed('/login');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Welcome To Flutter Firebase",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

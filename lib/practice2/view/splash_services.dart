import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cli/practice2/view/login.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashServices {
  void isLogin(BuildContext, context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const HomePage())));
    } else {
      Timer(
          const Duration(seconds: 2),
              () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage2())));
    }
  }
}

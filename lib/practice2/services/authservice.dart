// import 'package:firebase_auth/firebase_auth.dart';
// import '../../widgets/toast.dart';
//
// class FirebaseAuthService {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<User?> signUpWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential credential = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return credential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'email-already-in-use') {
//         showToast(message: 'Email already registered');
//       } else {
//         showToast(message: 'error accured : ${e.code}');
//       }
//     }
//     return null;
//   }
//
//   Future<User?> signInWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential credential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return credential.user;
//     } catch (e) {
//       print('some error');
//     }
//     return null;
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/verifycode.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var isPhoneAuth = false.obs;


  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        isPhoneAuth.value = true;
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Error', e.message ?? 'Unknown error');
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.to(() => VerifyCodeScreen(verificationId: verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyCode(String verificationId, String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(credential);
    isPhoneAuth.value = true;
  }

  // Future<void> signOut() async {
  //   await _auth.signOut();
  //   isPhoneAuth.value = false;
  // }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String username, bool rememberMe) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'username': username,
          'email': email,
        });
      }

      if (rememberMe) {
        await _saveUserCredentials(email, password);
      } else {
        await clearStoredCredentials();
      }

      return credential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Email already registered';
      } else {
        errorMessage = 'Error occurred: ${e.message}';
      }
      return Future.error(errorMessage);
    } catch (e) {
      return Future.error('An unknown error occurred');
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, bool rememberMe) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (rememberMe) {
        await _saveUserCredentials(email, password);
      } else {
        await clearStoredCredentials();
      }
      return credential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Error occurred: ${e.message}';
      return Future.error(errorMessage);
    } catch (e) {
      return Future.error('An unknown error occurred');
    }
  }



  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          await _saveGoogleSignInState();

          // Store user information in Firestore
          // DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
          // if (!doc.exists) {
          //   await _firestore.collection('users').doc(user.uid).set({
          //     'username': googleUser.displayName,
          //     'email': googleUser.email,
          //   });
          // }
        }

        return user;
      } else {
        return Future.error('Google sign-in cancelled');
      }
    } catch (e) {
      return Future.error('An unknown error occurred');
    }
  }


  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception('Error sending password reset email: ${e.message}');
    }
  }
  Future<void> _saveGoogleSignInState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isGoogleSignIn', true);
  }
  Future<void> clearGoogleSignInState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isGoogleSignIn', false);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    isPhoneAuth.value = false;


    await _googleSignIn.signOut(); // Sign out from Google
    await clearGoogleSignInState();

    await clearStoredCredentials();
  }

  Future<void> _saveUserCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('rememberMe', true);
  }

  Future<void> clearStoredCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.setBool('rememberMe', false);
  }

  Future<Map<String, String?>> getStoredCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    return {'email': email, 'password': password};
  }
  Future<bool> isRememberMeEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
  }

  Future<bool> isGoogleSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isGoogleSignIn') ?? false;
  }
}





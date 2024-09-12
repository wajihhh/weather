import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authservice1 {
  //for storing data in cloud firstore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

//for signup
//   Future<User?> signUpWithEmailAndPassword(String email, String password) async {
//
//     try {
//       UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     } on FirebaseAuthException catch (e) {
//
//       if (e.code == 'email-already-in-use') {
//         print("The email address is already in use");
//         // showToast(message: 'The email address is already in use.');
//       } else {
//         print("erororororo");
//         // showToast(message: 'An error occurred: ${e.code}');
//       }
//     }
//     return null;

  // }
  Future<String> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    String res = 'Some error Occurred';
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      //for adding user to our cloud firestore
      await _fireStore.collection('users').doc(credential.user!.uid).set({
        'name':name,
        'email': email,
        'uid':credential.user!.uid,
        //we can't store user password in pur cloud firestore
      });

      res = 'Successfulley';
    } catch (e) {
      print("ERRRORRRRRRRRRR");

    }
    return res;
  }
}









// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_cli/widgets/snackbar.dart';
//
//
//
// class FirebaseAuthService {
//
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<User?> signUpWithEmailAndPassword(String email, String password) async {
//
//     try {
//       UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     } on FirebaseAuthException catch (e) {
//
//       if (e.code == 'email-already-in-use') {
//         print("The email address is already in use");
//         // showToast(message: 'The email address is already in use.');
//       } else {
//         print("erororororo");
//         // showToast(message: 'An error occurred: ${e.code}');
//       }
//     }
//     return null;
//
//   }
//
//   Future<User?> signInWithEmailAndPassword(String email, String password) async {
//
//     try {
//       UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return credential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//         print("Invalid email");
//         // showSnackbar(context, 'Invalid email or password.');
//       } else {
//         print("error");
//         // showToast(message: 'An error occurred: ${e.code}');
//       }
//
//     }
//     return null;
//
//   }
//
//
//
//
// }
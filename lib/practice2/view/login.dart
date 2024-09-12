// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_cli/practice2/view/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../../widgets/container.dart';
// import '../../widgets/toast.dart';
// import '../services/authservice.dart';
//
// class LoginPage2 extends StatefulWidget {
//   const LoginPage2({super.key});
//
//   @override
//   State<LoginPage2> createState() => _LoginPage2State();
// }
//
// class _LoginPage2State extends State<LoginPage2> {
//   bool _isSigning = false;
//   final FirebaseAuthService _auth = FirebaseAuthService();
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage("assets/images/night.png"),
//       )),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         // appBar: AppBar(
//         //   automaticallyImplyLeading: false,
//         //   title: Text("Login"),
//         // ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Login",
//                   style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 FormContainerWidget(
//                   controller: _emailController,
//                   hintText: "Email",
//                   isPasswordField: false,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 FormContainerWidget(
//                   controller: _passwordController,
//                   hintText: "Password",
//                   isPasswordField: true,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     _signIn();
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     height: 45,
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: _isSigning
//                           ? CircularProgressIndicator(
//                               color: Colors.white,
//                             )
//                           : Text(
//                               "Login",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const SignUpPage()),
//                       (route) => false,
//                     );
//                   },
//                   child: const Text(
//                     "Sign Up",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 const Row(
//                   children: [
//                     Expanded(
//                       child: Divider(
//                         color: Colors.white, // Line color
//                         thickness: 1, // Line thickness
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Text(
//                         "Or",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(
//                         color: Colors.white, // Line color
//                         thickness: 1, // Line thickness
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     _signInWithGoogle();
//                   },
//                   child: Center(
//                     child: Image.asset(
//                       "assets/images/download-removebg-preview.png",
//                       height: 50,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _signIn() async {
//     setState(() {
//       _isSigning = true;
//     });
//
//     String email = _emailController.text;
//     String password = _passwordController.text;
//
//     User? user = await _auth.signInWithEmailAndPassword(email, password);
//
//     setState(() {
//       _isSigning = false;
//     });
//
//     if (user != null) {
//       showToast(message: "User is successfully signed in");
//       Navigator.pushNamed(context, "/home");
//     } else {
//       showToast(message: "some error occured");
//     }
//   }
//
//   _signInWithGoogle() async {
//     final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await _googleSignIn.signIn();
//
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;
//
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken,
//         );
//
//         await _firebaseAuth.signInWithCredential(credential);
//         Navigator.pushNamed(context, "/home");
//       }
//     } catch (e) {
//       showToast(message: "some error occured $e");
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/container.dart';
import '../../widgets/toast.dart';
import '../services/authservice.dart';
import 'forgot_password.dart';
import 'login_with_phone.dart';
import 'signup.dart';

import 'package:get/get.dart';


class LoginPage2 extends StatelessWidget {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RxBool _isSigning = false.obs;
  final RxBool _isSigningg = false.obs;
  final RxBool _rememberMe = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/night.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                const SizedBox(height: 10),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() =>
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe.value,
                              onChanged: (value) {
                                _rememberMe.value = value ?? false;
                              },
                            ),
                            const Text(
                              "Remember Me",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                    GestureDetector(
                      onTap: () {
                        Get.to(const ForgotPasswordPage());

                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: _signIn,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Obx(() =>
                      _isSigning.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.offAll(const SignUpPage());
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Or",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _signInWithGoogle,
                  child: Center(
                    child: Image.asset(
                      "assets/images/download-removebg-preview.png",
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap:(){
                    print("sas");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginWithPhoneNumber()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Obx(() =>
                      _isSigningg.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Icon(Icons.phone,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text(
                                                      "Sign In With Phone",
                                                      style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                            ],
                          )),
                    ),
                  ),
                ),
                // PhoneAuthentication(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    _isSigning.value = true;
    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      User? user = await _auth.signInWithEmailAndPassword(
          email, password, _rememberMe.value);
      if (user != null) {
        Get.offAllNamed('/home');
      } else {
        showToast(message: "Failed to sign in");
      }
    } catch (e) {
      showToast(message: e.toString());
    } finally {
      _isSigning.value = false;
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      User? user = await _auth.signInWithGoogle();
      if (user != null) {
        Get.offAllNamed('/home');
      } else {
        print("cancel");
        showToast(message: "Google sign-in cancelled");
      }
    } catch (e) {
      print("error");
      showToast(message: "$e");
    }
  }



}

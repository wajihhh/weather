// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_cli/practice2/view/home.dart';
// import 'package:flutter/material.dart';
//
// class OtpScreen extends StatefulWidget {
//   final String verificationId;
//
//   const OtpScreen({super.key, required this.verificationId});
//
//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }
//
// class _OtpScreenState extends State<OtpScreen> {
//   bool isLoading = false;
//   final TextEditingController otpController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextField(
//             controller: otpController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: '+923338977479',
//                 labelText: 'Enter the Phone Number'),
//           ),
//           isLoading? CircularProgressIndicator()
//               :          ElevatedButton(
//               onPressed: () async {
//                 // await FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
//
//                 setState(() {
//                   isLoading = true;
//                 });
//
//                 try {
//
//                   final credential = PhoneAuthProvider.credential(
//                       verificationId: widget.verificationId,
//                       smsCode: otpController.text);
//                   await FirebaseAuth.instance.signInWithCredential(credential);
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));
//                 } catch (e) {
//                   print(e);
//
//                 }
//                 setState(() {
//                   isLoading = true;
//                 });
//               },
//               child: Text("Verify Code"))
//
//
//         ],
//       ),
//     );
//   }
// }
//
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_cli/practice2/view/home.dart';
// // import 'package:flutter/material.dart';
// //
// // class OTPScreen extends StatefulWidget {
// //   final String verificationId;
// //   const OTPScreen({super.key, required this.verificationId});
// //
// //   @override
// //   State<OTPScreen> createState() => _OTPScreenState();
// // }
// //
// // class _OTPScreenState extends State<OTPScreen> {
// //   TextEditingController otpController = TextEditingController();
// //   // we have also add the circular profressIndicator during waiting time
// //   bool isLoadin = false;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             Image.asset("images/otpimage.jpg"),
// //             const Text(
// //               "OTP Verification",
// //               style: TextStyle(
// //                 fontWeight: FontWeight.bold,
// //                 fontSize: 25,
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.symmetric(horizontal: 20),
// //               child: Text(
// //                 "We need to register your phone number by using a one-time OTP code verfification.",
// //                 textAlign: TextAlign.center,
// //                 style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.w500,
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(20.0),
// //               child: TextField(
// //                 controller: otpController,
// //                 keyboardType: TextInputType.phone,
// //                 decoration: const InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   hintText: "+9771234567890",
// //                   labelText: "Enter the Phone Number",
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             isLoadin
// //                 ? const CircularProgressIndicator()
// //                 : ElevatedButton(
// //                 style:
// //                 ElevatedButton.styleFrom(backgroundColor: Colors.green),
// //                 onPressed: () async {
// //                   setState(() {
// //                     isLoadin = true;
// //                   });
// //                   try {
// //                     final credential = PhoneAuthProvider.credential(
// //                       verificationId: widget.verificationId,
// //                       smsCode: otpController.text,
// //                     );
// //                     await FirebaseAuth.instance
// //                         .signInWithCredential(credential);
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => const HomePage(),
// //                       ),
// //                     );
// //                   } catch (e) {
// //                     print(e);
// //                   }
// //                   setState(() {
// //                     isLoadin = false;
// //                   });
// //                 },
// //                 child: const Text(
// //                   "Send Code",
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 16,
// //                     color: Colors.white,
// //                   ),
// //                 ))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

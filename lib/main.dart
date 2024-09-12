// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:firebase_cli/practice2/view/home.dart';
// import 'package:firebase_cli/practice2/view/login.dart';
// import 'package:firebase_cli/practice2/view/signup.dart';
// import 'package:firebase_cli/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'chat/pages/login_page.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   FirebaseAnalytics;
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   await FirebaseAppCheck.instance.activate(
//     webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
//     androidProvider: AndroidProvider.playIntegrity,
//   );
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         textTheme: GoogleFonts.aBeeZeeTextTheme(),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home: LoginPage(),
//       routes: {
//         '/': (context) => const SplashScreen(
//               // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
//               child: LoginPage2(),
//             ),
//         '/login': (context) => const LoginPage2(),
//         '/signUp': (context) => const SignUpPage(),
//         '/home': (context) => const HomePage(),
//       },
//     );
//   }
// }


import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cli/practice2/view/forgot_password.dart';
import 'package:firebase_cli/practice2/view/home.dart';
import 'package:firebase_cli/practice2/view/login.dart';
import 'package:firebase_cli/practice2/view/signup.dart';
import 'package:firebase_cli/splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);




  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.playIntegrity,
  );

  runApp(MyApp());
}
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp();
  print(message.notification!.title.toString());
  print(message.notification!.body.toString());
  print(message.data.toString());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Define the initial route based on user authentication
      // initialRoute: FirebaseAuth.instance.currentUser != null ? '/home' : '/login',
      home: const SplashScreen(),
      routes: {

        '/login': (context) =>  LoginPage2(),
        '/signUp': (context) => const SignUpPage(),
        '/home': (context) =>  const HomePage(),
        '/forgot-password': (context) => const ForgotPasswordPage(), // Forgot password page route

      },
    );
  }
}



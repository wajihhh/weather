import 'package:flutter/material.dart';

import 'signup_screen.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
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
          ElevatedButton(onPressed: () {}, child: const Text('Login')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignupScreen1()));
              },
              child: const Text('Signup'))
        ],
      ),
    );
  }
}


//import 'package:firebase_app_check/firebase_app_check.dart';
// import 'package:firebase_cli/practice1/view/login_screen.dart';
// import 'package:firebase_cli/practice2/view/home.dart';
// import 'package:firebase_cli/practice2/view/signup.dart';
// import 'package:firebase_cli/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'chat/pages/login_page.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   // FirebaseAnalytics;
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   // await registerServices();
//
//   await FirebaseAppCheck.instance.activate(
//     webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
//     androidProvider: AndroidProvider.playIntegrity,
//   );
//
//   // late AuthService _authService;
//
//   runApp( MyApp());
// }
//
// // void main() async {
// //   FirebaseAnalytics;
// //   await setup();
// //   runApp(MyApp());
// // }
// //
// // Future<void> setup() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await setupFirebase();
// //   await registerServices();
// // }
//
// class MyApp extends StatelessWidget {
//   // final GetIt _getIt = GetIt.instance;
//   // late NavigationService _navigationService;
//   // late AuthService _authService;
//
//   // MyApp({super.key})
//   // {
//   //
//   //   _navigationService = _getIt.get<NavigationService>();
//   //   _authService = _getIt.get<AuthService>();
//   //
//   // }
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // navigatorKey: _navigationService.navigatorKey,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         textTheme: GoogleFonts.montserratTextTheme(),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // initialRoute: _authService.user!=null ? '/home':'/login',
//       // routes: _navigationService.routes,
//       // home: LoginScreen1(),
//       routes: {
//         '/': (context) => SplashScreen(
//           // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
//           child: LoginPage(),
//         ),
//         '/login': (context) => LoginPage(),
//         '/signUp': (context) => SignUpPage(),
//         '/home': (context) => HomePage(),
//       },
//     );
//   }
// }
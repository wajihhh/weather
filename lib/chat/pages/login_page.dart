// import 'package:firebase_cli/chat/const.dart';
// import 'package:firebase_cli/chat/services/alert_service.dart';
// import 'package:firebase_cli/chat/services/auth_service.dart';
// import 'package:firebase_cli/chat/services/navigation_service.dart';
// import 'package:firebase_cli/chat/widgets/custom_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
//
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   late NavigationService _navigationService;
//   final GetIt getIt = GetIt.instance;
//   final GlobalKey<FormState> _loginFormKey = GlobalKey();
//   late AuthService _authService;
//   late AlertService _alertService;
//   String? email, password;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _authService = getIt.get<AuthService>();
//     _navigationService = getIt.get<NavigationService>();
//     _alertService = getIt.get<AlertService>();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: _buildUI(),
//     );
//   }
//
//   Widget _buildUI() {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 15,
//           vertical: 20,
//         ),
//         child: Column(
//           children: [
//             _headerText(),
//             _loginForm(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _headerText() {
//     return SizedBox(
//       width: MediaQuery.sizeOf(context).width,
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Hi, Welcome Back!',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
//           ),
//           Text(
//             'Hello again',
//             style: TextStyle(
//                 color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _loginForm() {
//     return Container(
//       // color: Colors.yellow,
//       height: MediaQuery.of(context).size.height * 0.4,
//       margin: EdgeInsets.symmetric(
//         vertical: MediaQuery.of(context).size.height * 0.05,
//       ),
//       child: Form(
//           key: _loginFormKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CustomFormField(
//                 onSaved: (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//                 validationRegEx: EMAIL_VALIDATION_REGEX,
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 hintText: 'Email',
//               ),
//               CustomFormField(
//                 suffixIcon: true,
//                 onSaved: (value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//                 obscureText: true,
//                 validationRegEx: PASSWORD_VALIDATION_REGEX,
//                 height: MediaQuery.of(context).size.height * 0.1,
//                 hintText: 'Password',
//               ),
//               _loginButton(),
//               _createAnAccountLink(),
//             ],
//           )),
//     );
//   }
//
//   Widget _loginButton() {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: MaterialButton(
//         color: Theme.of(context).colorScheme.primary,
//         child: const Text(
//           'Login',
//           style: TextStyle(color: Colors.white),
//         ),
//         onPressed: () async {
//           if (_loginFormKey.currentState?.validate() ?? false) {
//             _loginFormKey.currentState?.save();
//             bool result = await _authService.login(email!, password!);
//             print(result);
//             if (result) {
//               _navigationService.pushReplacementNamed('/home');
//             } else {
//               _alertService.showToast(
//                   text: "Failed to login, Please try again", icon: Icons.error);
//             }
//             print(email);
//             print(password);
//           }
//         },
//       ),
//     );
//   }
//
//   Widget _createAnAccountLink() {
//     return const Expanded(
//         child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Text("Don't have an account?"),
//         Text("Signup"),
//       ],
//     ));
//   }
// }

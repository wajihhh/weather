// import 'package:firebase_cli/chat/services/auth_service.dart';
// import 'package:firebase_cli/chat/services/navigation_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
//
// class ChatHome extends StatefulWidget {
//   const ChatHome({super.key});
//
//   @override
//   State<ChatHome> createState() => _ChatHomeState();
// }
//
// class _ChatHomeState extends State<ChatHome> {
//
//   final GetIt _getIt = GetIt.instance;
//   late AuthService _authService;
//   late NavigationService _navigationService;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _authService = _getIt.get<AuthService>();
//     _navigationService = _getIt.get<NavigationService>();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Messages"),
//         actions: [
//           IconButton(
//               onPressed: ()async{
//                 bool result = await _authService.logout();
//                 if(result){
//                   _navigationService.pushReplacementNamed('/login');
//                 }
//               },
//             color: Colors.red,
//               icon: Icon(Icons.logout),
//           )
//         ],
//       ),
//     );
//   }
// }

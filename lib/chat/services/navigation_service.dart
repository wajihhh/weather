// import 'package:firebase_cli/chat/home.dart';
// import 'package:firebase_cli/chat/pages/login_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:path/path.dart';
//
// class NavigationService{
//   late GlobalKey<NavigatorState> _navigatorKey;
//
//
//   final Map<String, Widget Function(BuildContext)>_routes = {
//     '/login' : (context) => LoginPage(),
//     '/home' : (context) => ChatHome(),
//   };
//
//   GlobalKey<NavigatorState>? get navigatorKey{
//     return _navigatorKey;
//   }
//
//   Map<String,Widget Function(BuildContext)> get routes{
//     return _routes;
//   }
//   NavigationService(){
//     _navigatorKey = GlobalKey<NavigatorState>();
//   }
//
//   void pushNamed(String routeName){
//     _navigatorKey.currentState?.pushNamed(routeName);
//   }
//
//   void pushReplacementNamed(String routeName){
//     _navigatorKey.currentState?.pushReplacementNamed(routeName);
//   }
//
//   void goBack(){
//     _navigatorKey.currentState?.pop();
//   }
// }
// import 'package:firebase_cli/chat/services/alert_service.dart';
// import 'package:firebase_cli/chat/services/auth_service.dart';
// import 'package:firebase_cli/chat/services/navigation_service.dart';
// import 'package:firebase_cli/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get_it/get_it.dart';
//
// Future<void> setupFirebase() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
// }
//
// Future<void> registerServices() async {
//   final GetIt getIt = GetIt.instance;
//   getIt.registerSingleton<AuthService>(
//     AuthService(),
//   );
//
//   getIt.registerSingleton<NavigationService>(
//     NavigationService(),
//   );
//
//   getIt.registerSingleton<AlertService>(
//       AlertService(),);
// }

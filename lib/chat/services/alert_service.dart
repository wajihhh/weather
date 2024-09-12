// import 'package:delightful_toast/delight_toast.dart';
// import 'package:delightful_toast/toast/components/toast_card.dart';
// import 'package:delightful_toast/toast/utils/enums.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
//
// import 'navigation_service.dart';
//
// class AlertService {
//   final GetIt _getIt = GetIt.instance;
//
// late NavigationService _nAvigationService;
//   AlertService() {
//
// _nAvigationService = _getIt.get<NavigationService>();
//   }
//
//   void showToast({
//     required String text,
//     IconData icon = Icons.info
//   }) {
//     try {
//       DelightToastBar(
//
//         autoDismiss: true,
//         position: DelightSnackbarPosition.top,
//         builder: (BuildContext context) {
//           return ToastCard(
//               leading: Icon(icon,size: 28,),
//               title: Text(text,style: TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 16
//           ),));
//         },
//       ).show(_nAvigationService.navigatorKey!.currentContext!);
//     } catch (e) {
//
//     }
//   }
// }
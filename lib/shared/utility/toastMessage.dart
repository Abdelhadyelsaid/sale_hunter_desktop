// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class ToastMessage extends StatefulWidget {
//
//   ToastMessage _toastMessage;
//
//   @override
//   State<StatefulWidget> createState() {
//     _toastMessage =ToastMessage();
//     return _toastMessage;
//   }
//
//
// }
//
// class _ToastMessageState extends State<ToastMessage> {
//   FToast fToast;
//   void showToast(String Message) {
//     Widget toast = Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: Colors.greenAccent,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.check),
//           SizedBox(
//             width: 12.0,
//           ),
//           Text("$Message"),
//         ],
//       ),
//     );
//
//     fToast.showToast(
//       child: toast,
//       gravity: ToastGravity.TOP,
//       toastDuration: Duration(seconds: 2),
//     );
//   }
//   void showErrorToast(String Message) {
//     Widget toast = Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: Colors.red,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.warning),
//           SizedBox(
//             width: 12.0,
//           ),
//           Text("$Message"),
//         ],
//       ),
//     );
//
//     fToast.showToast(
//       child: toast,
//       gravity: ToastGravity.TOP,
//       toastDuration: Duration(seconds: 2),
//     );
//   }
//   @override
//   void initState() {
//     super.initState();
//     fToast = FToast();
//     fToast.init(context);
//   }
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:smarttouristguide/shared/styles/colors.dart';
// import 'package:splash_screen_view/SplashScreenView.dart';
//
// class SplashScreen extends StatefulWidget {
//   final Widget widget;
//
//   const SplashScreen({Key? key, required this.widget}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // decoration: const BoxDecoration(
//       //   gradient: LinearGradient(
//       //       begin: Alignment.topCenter,
//       //       end: Alignment.bottomCenter,
//       //       colors: [
//       //         AppColors.primaryColor,
//       //         Color.fromRGBO(250, 250, 250, 1.0)
//       //       ]),
//       // ),
//       child: SplashScreenView(
//         backgroundColor: AppColors.backgroundColor,
//         colors: [
//           AppColors.primaryColor,
//           Colors.red,
//           Colors.green,
//         ],
//         text: 'HELLO TO SPLASH',
//         duration: 2200,
//         speed: 200,
//         navigateRoute: widget.widget,
//         imageSrc: "assets/images/logo2.png",
//         imageSize: 400,
//         pageRouteTransition: PageRouteTransition.SlideTransition,
//       ),
//     );
//   }
// }

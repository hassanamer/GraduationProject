import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/login/success_screens/check_mail_success.dart';

import 'modules/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Tourist guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   SuccessScreen(),
    );
  }
}
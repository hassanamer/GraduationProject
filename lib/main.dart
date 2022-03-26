import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/OfferScreen.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/eventScreen.dart';
import 'package:smarttouristguide/modules/home/MenuDrawerScreen.dart';
import 'package:smarttouristguide/modules/login/Login&SignUp/welcomScreen.dart';
import 'package:smarttouristguide/modules/login/success_screens/check_mail_success.dart';
import 'package:smarttouristguide/modules/login/success_screens/password_change_success.dart';
import 'package:smarttouristguide/modules/user/user_screen.dart';
import 'modules/Event&Offer&Places/places/placeScreen.dart';
import 'modules/home/home_screen.dart';
import 'modules/login/change_new_password.dart';

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
        primaryColor: Color(0xff005764),
        colorScheme:ColorScheme.fromSwatch().copyWith(
          secondary:Color(0xffBEC5D1),//buttonColor
            inversePrimary: Color(0xff9CA3AF),//textColor ,unSelectedItems
          background: Color(0xffF6F6F6)
        ),
      ),
      home: Welcome(),
    );
  }
}

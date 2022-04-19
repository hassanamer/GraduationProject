import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/places/placeScreen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/LoginButton.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/SignUpScreen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/login_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';
import 'package:smarttouristguide/shared/styles/themes.dart';

import 'modules/Event&Offer&Places/OfferScreen.dart';
import 'modules/Event&Offer&Places/eventScreen.dart';
import 'modules/home/MenuDrawerScreen.dart';
import 'modules/login/login_and_signup/SignUpScreen.dart';
import 'modules/login/login_and_signup/SignUpScreen.dart';
import 'modules/login/login_and_signup/forget_password.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),

        ),
      ],
      child: MaterialApp(
          routes: {
            Welcome.routeName: (context) => Welcome(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Smart Tourist guide',
          theme: lightTheme,
          home: menuDrawerScreen()),
    );
  }
}

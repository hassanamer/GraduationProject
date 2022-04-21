import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';
import 'package:smarttouristguide/shared/styles/themes.dart';
import 'modules/event_offer_places/OfferScreen.dart';
import 'modules/event_offer_places/eventScreen.dart';
import 'modules/event_offer_places/places/placeDetailsScreen.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Smart Tourist guide',
        theme: lightTheme,
        home: Welcome(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          Welcome.routeName: (context) => Welcome(),
          PlaceDetailsScreen.routeName: (context) => PlaceDetailsScreen(),
          OfferScreen.routeName: (context) => OfferScreen(),
          EventScreen.routeName: (context) => EventScreen(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smarttouristguide/modules/categories/categories_screen.dart';
import 'package:smarttouristguide/modules/cubit/cubit.dart';
import 'package:smarttouristguide/modules/home/MenuDrawerScreen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';
import 'package:smarttouristguide/shared/styles/themes.dart';
import 'modules/event_offer_places/OfferScreen.dart';
import 'modules/event_offer_places/eventScreen.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
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
          create: (BuildContext context) => ChangeColorCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Tourist guide',

       // locale: Locale("${changeLanguage()}"),
        theme: lightTheme,
        home: CategoriesScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          Welcome.routeName: (context) => Welcome(),
          OfferScreen.routeName: (context) => OfferScreen(),
          EventScreen.routeName: (context) => EventScreen(),
          PlaceDetailsScreen.routeName: (context) => PlaceDetailsScreen(),
        },
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('en'),
      ),
    );
  }
}

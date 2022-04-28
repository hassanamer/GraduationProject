import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/cubit/cubit.dart';
import 'package:smarttouristguide/modules/home/MenuDrawerScreen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/SignUpScreen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/login_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';
import 'package:smarttouristguide/shared/styles/themes.dart';
import 'modules/Place Details/place_details_screen.dart';
import 'modules/event_offer_places/OfferScreen.dart';
import 'modules/event_offer_places/eventScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        //locale: Locale("${changeLanguage()}"),
        theme: lightTheme,
        home: Welcome(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          Welcome.routeName: (context) => Welcome(),
          OfferScreen.routeName: (context) => OfferScreen(),
          EventScreen.routeName: (context) => EventScreen(),
          PlaceDeatilsScreen.routeName: (context) => PlaceDeatilsScreen(),
        },
      ),
    );
  }
}


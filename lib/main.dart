import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/layout/cubit/bloc_observer.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/cubit/cubit.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';
import 'package:smarttouristguide/shared/styles/themes.dart';
import 'modules/event_offer_places/OfferScreen.dart';
import 'modules/event_offer_places/eventScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );

  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..test()..getData(),
        ),
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
        home: AppLayout(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          Welcome.routeName: (context) => Welcome(),
          OfferScreen.routeName: (context) => OfferScreen(),
          EventScreen.routeName: (context) => EventScreen(),
        },
      ),
    );
  }
}

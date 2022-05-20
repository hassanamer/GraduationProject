import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/cubit/cubit.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/forget_password.dart';
import 'package:smarttouristguide/modules/profile/profile_screen.dart';
import 'package:smarttouristguide/modules/register/register_cubit/cubit.dart';
import 'package:smarttouristguide/modules/welcome_screen/welcome_screen.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/on_boarding/on_boarding_screen.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/constants.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';
import 'package:smarttouristguide/shared/styles/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  dynamic onBoarding = CacheHelper.getData(key: 'OnBoarding');

  token = CacheHelper.getData(key: 'token') ?? '';

  print(token);

  if (onBoarding != null) {
    if (token != '') {
      widget = AppLayout();
    } else {
      widget = Welcome();
    }
  } else {
    widget = OnBoardingScreen();
  }

  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    required this.startWidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppRegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppLoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..getHomeData()
            ..getCategoriesPlacesData()
            ..getFavorites()
            ..getProfile(),
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
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(375, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
        home: startWidget,
        // home: startWidget,
        routes: {
          Welcome.routeName: (context) => Welcome(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          ForgetPassword.routeName: (context) => ForgetPassword(),
          PlaceDetailsScreen.routeName: (context) => PlaceDetailsScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}

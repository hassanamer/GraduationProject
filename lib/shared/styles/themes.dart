import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Palette.primaryColor,
  fontFamily: 'Jannah',
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: AppColors.backgroundColor,
    statusBarIconBrightness: Brightness.dark,
  ),
    backgroundColor: AppColors.backgroundColor,
    elevation: 0.0,
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Palette.primaryColor,
  fontFamily: 'Jannah',
  scaffoldBackgroundColor: Colors.blueGrey,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: AppColors.backgroundColor,
    elevation: 0.0,
  ),

);

import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Palette.primaryColor,
  fontFamily: 'Jannah',
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0.0,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xffBEC5D1),
    //buttonColor
    inversePrimary: const Color(0xff9CA3AF),
    //textColor ,unSelectedItems
    background: const Color(0xffF6F6F6),
  ),
);

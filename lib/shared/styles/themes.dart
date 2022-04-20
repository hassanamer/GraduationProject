import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Palette.primaryColor,
  fontFamily: 'Jannah',
  scaffoldBackgroundColor: AppColors.screenBackgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.screenBackgroundColor,
    elevation: 0.0,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Color(0xffBEC5D1),
    //buttonColor
    inversePrimary: Color(0xff9CA3AF),
    //textColor ,unSelectedItems
    background: Color(0xffF6F6F6),
  ),
);

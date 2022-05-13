import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff005764);
  static const Color secondColor = Color(0xffffebc9);
  static const Color backgroundColor = Color(0xfff6f6f6);
  static const Color buttonTextColor = Color(0xffffffff);
  static const Color textFieldColor = Color(0xffbec5d1);
  static const Color buttonTwoColor = Color(0xffc1d4d6);
  static const Color disabledAndHintColor = Color(0xff9ca3af);
  static const Color bodyDetailsColor = Color(0xff6b7280);
}

class Palette {
  static const MaterialColor primaryColor = const MaterialColor(
    0xff005764, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffce5641), //10%
      100: const Color(0xffb74c3a), //20%
      200: const Color(0xffa04332), //30%
      300: const Color(0xff89392b), //40%
      400: const Color(0xff733024), //50%
      500: const Color(0xff5c261d), //60%
      600: const Color(0xff451c16), //70%
      700: const Color(0xff2e130e), //80%
      800: const Color(0xff170907), //90%
      900: const Color(0xff000000), //100%
    },
  );
}

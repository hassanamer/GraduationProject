import 'package:flutter/material.dart';

import '../../../shared/styles/buttons_style.dart';
import '../../../shared/styles/colors.dart';
import 'login_screen.dart';

class LoginAndSignUpButton extends StatelessWidget {
  // static const String routeName = 'loginButton';
var Screen;
String text;

LoginAndSignUpButton(this.Screen, this.text);

  @override
  Widget build(BuildContext context) {
    return  button(function: (){ showModalBottomSheet(
    isDismissible: false,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
    return Container(
    height: double.infinity,
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20)),
    color: Colors.white),
    child: Screen);
    });}, text: text)

      ;

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

//default button (ex: Registeration,Login, Submit)
Widget defaultButton({
  required double width,
  required Color background,
  required Function function,
  required String text,
  required ButtonStyle buttonStyle,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(color: AppColors.buttonTextColor),
        ),
      ),
    );

void navigateTo({required widget, required context}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);



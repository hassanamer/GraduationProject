import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

Widget button({
  required VoidCallback? function,
  required String text,
  Color color = AppColors.primaryColor,
  Color textColor = Colors.white,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 80),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
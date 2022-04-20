import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class textStyle extends StatelessWidget {
  late String text;
  late double textSize;

  textStyle.normal(this.text, this.textSize);

  textStyle(this.text, this.textSize, this.fontWeight);

  FontWeight fontWeight = FontWeight.bold;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(text,
            style: TextStyle(
                fontSize: textSize,
                color: AppColors.primaryColor,
                fontWeight: fontWeight)));
  }
}

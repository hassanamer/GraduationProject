import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 280,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                11.0,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 21.0,
                ),
                Icon(
                  Icons.search,
                  color: AppColors.disabledAndHintColor,
                ),
                SizedBox(
                  width: 17.0,
                ),
                Text(
                  'Where to go?',
                  style: TextStyle(
                    color: AppColors.disabledAndHintColor,
                  ),
                ),
                SizedBox(
                  width: 107.5,
                ),
                Icon(
                  Icons.mic,
                  color: AppColors.disabledAndHintColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/buttons_style.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            button(
              text: 'text',
              function: () {},
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(
                  0.3,
                ),
              ),
              child: Text(
                'Discover Places',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

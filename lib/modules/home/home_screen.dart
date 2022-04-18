import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                  const SizedBox(
                    width: 21.0,
                  ),
                  SvgPicture.asset('assets/icons/search.svg'),
                  const SizedBox(
                    width: 17.0,
                  ),
                  Text(
                    'Where to go?',
                    style: TextStyle(
                      color: AppColors.disabledAndHintColor,
                    ),
                  ),
                  SizedBox(
                    width: 95.0,
                  ),
                  SvgPicture.asset('assets/icons/mic.svg'),
                ],
              ),
            ),
            SizedBox(
              height: 19.0,
            ),
            HomeRow(
              text: 'events',
              iconPath: 'assets/icons/events.svg',
              width: 233.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            HomeRow(
              text: 'offers',
              iconPath: 'assets/icons/offers.svg',
              width: 266.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            HomeRow(
              text: 'plan',
              iconPath: 'assets/icons/plan.svg',
              width: 299.0,
            ),
          ],
        ),
      ),
    );
  }
}

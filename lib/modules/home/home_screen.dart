import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/places/iconOfRate.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
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
                            SizedBox(
                              width: 21.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/search.svg',
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
                              width: 95.0,
                            ),
                            SvgPicture.asset(
                              'assets/icons/mic.svg',
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 15.0,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: HomeRow(
                        text: 'events',
                        iconPath: 'assets/icons/events.svg',
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: HomeRow(
                        text: 'offers',
                        iconPath: 'assets/icons/offers.svg',
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: HomeRow(
                        text: 'plan',
                        iconPath: 'assets/icons/plan.svg',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Places',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    Text(
                      'Top popular places in Egypt',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Container(
                      height: 178.0,
                      width: 148.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0,),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Center(
                              child: Image.asset('assets/images/test.jpg',
                              height: 112),
                            ),
                            Text(
                              'Giza Pyramids',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                              [
                                rate(),
                                rate(),
                                rate(),
                                rate(),
                                rate(),
                                Spacer(),
                                SvgPicture.asset('assets/icons/goto.svg',)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    HomeItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

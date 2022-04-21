import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/modules/event_offer_places/OfferScreen.dart';
import 'package:smarttouristguide/modules/event_offer_places/eventScreen.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../shared/components/components.dart';
import '../event_offer_places/places/iconOfRate.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        const SizedBox(
                          width: 21.0,
                        ),
                        SvgPicture.asset(
                          'assets/icons/search.svg',
                        ),
                        const SizedBox(
                          width: 17.0,
                        ),
                        const Text(
                          'Where to go?',
                          style: TextStyle(
                            color: AppColors.disabledAndHintColor,
                          ),
                        ),
                        const SizedBox(
                          width: 95.0,
                        ),
                        SvgPicture.asset(
                          'assets/icons/mic.svg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(EventScreen.routeName);
                    },
                    child: HomeRow(
                      text: 'events',
                      iconPath: 'assets/icons/events.svg',
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(OfferScreen.routeName);
                    },
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
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular Places',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21.0,
                    ),
                  ),
                  const Text(
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
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset('assets/images/test.jpg',
                                height: 112),
                          ),
                          const Text(
                            'Giza Pyramids',
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              rate(),
                              rate(),
                              rate(),
                              rate(),
                              rate(),
                              const Spacer(),
                              SvgPicture.asset(
                                'assets/icons/goto.svg',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    parsePost(String responseBody)
    {
      var list = json.decode(responseBody) as List<dynamic>;
      var post = list.map((model)
      {
        StgModel.fromJson(model);
      }).toList();

      return post;
    }

    Future<List<StgModel>> getData() async {
      final url = await http.get(
        Uri.parse(
            'https://gist.githubusercontent.com/amrali500/f6f888bb859d96eb185aceea849cf127/raw/c542bef9f8e16a7f48055db01d41e8024eae51f4/STGapi.json'),
      );
      if (url.statusCode ==200)
      {
        return compute(getData());
      }
    }

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
                      text: AppLocalizations.of(context)!.events,
                      iconPath: 'assets/icons/events.svg',
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: HomeRow(
                      text: AppLocalizations.of(context)!.offers,
                      iconPath: 'assets/icons/offers.svg',
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: HomeRow(
                      text: AppLocalizations.of(context)!.plan,
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
              padding: const EdgeInsets.only(
                left: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.popular_places,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21.0,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.popular_places_in_egypt,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  HomeItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget HomeItem() => Container(
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
              child: Image.asset('assets/images/test.jpg', height: 112),
            ),
            Text(
              'Giza Pyramids',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(false, 18),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/goto.svg',
                )
              ],
            ),
          ],
        ),
      ),
    );

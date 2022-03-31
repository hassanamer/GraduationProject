import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/modules/event_offer_places/places/iconOfRate.dart';

import '../../../shared/styles/textStyle.dart';

class PlacesBody extends StatelessWidget {
  final String hidder;
  final String someDetails;
  final String pathOfImage;

  PlacesBody(this.hidder, this.someDetails, this.pathOfImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: textStyle(
                      hidder,
                      22,
                      FontWeight.bold,
                    )),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              textStyle.normal('someDetails', 16),
              SizedBox(
                width: 40,
              ),
            ]),
            Container(
              margin: EdgeInsets.all(8),
              child: Image.asset(pathOfImage),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              rate(),
              rate(),
              rate(),
              rate(),
              rate(),
              Spacer(),
              SvgPicture.asset('assets/icons/active_navigate.svg'),
              SizedBox(
                width: 5,
              ),
              textStyle.normal('see Details', 14),
              SizedBox(
                width: 30,
              )
            ]),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/textStyle.dart';

import '../../shared/styles/colors.dart';

class eventAndOfferBody extends StatelessWidget {
  final String hidder;
  final String someDetails;

  eventAndOfferBody(this.hidder, this.someDetails, this.pathOfImage);

  final String pathOfImage;
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
                const SizedBox(
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
              const SizedBox(
                width: 40,
              ),
            ]),
            Container(
              margin: const EdgeInsets.all(8),
              child: Image.asset(pathOfImage),

            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              InkWell(
                onTap: () {
                  //na2as       al           details            screen             hana         (:
                },
                child: const Icon(Icons.assistant_navigation,
                    color: AppColors.primaryColor),
              ),
              const SizedBox(
                width: 5,
              ),
              textStyle.normal('see Details', 14),
              const SizedBox(
                width: 30,
              )
            ]),
          ],
        ),
      ),
    );
  }
}

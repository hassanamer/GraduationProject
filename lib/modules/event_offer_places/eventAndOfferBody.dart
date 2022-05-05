import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import '../../shared/styles/textStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class eventAndOfferBody extends StatelessWidget {
  final String header;
  final String someDetails;

  eventAndOfferBody(this.header, this.someDetails, this.pathOfImage);

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
                      header,
                      22,
                      FontWeight.bold,
                    )),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                  onTap: () {
                    navigateTo(
                      widget: PlaceDetailsScreen(),
                      context: context,
                    );
                  },
                  child: textStyle.normal('someDetails', 16)),
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
                child: SvgPicture.asset(
                  'assets/icons/active_navigate.svg',
                ),
                onTap: () {
                  {
                    Navigator.of(context)
                        .pushNamed(PlaceDetailsScreen.routeName);
                  }
                },
              ),
              const SizedBox(
                width: 5,
              ),
              textStyle.normal(AppLocalizations.of(context)!.see_details, 14),
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

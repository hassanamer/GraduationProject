import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/event_offer_places/places/places_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Historic Tourism',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/ctg.jpg',
                    height: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 13.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      navigateTo(
                        widget: PlacesScreen(),
                        context: context,
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          0.78,
                        ),
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.discover_places,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

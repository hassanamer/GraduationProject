import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';

import '../../shared/styles/colors.dart';
import 'offer_body.dart';

class OffersScreen extends StatelessWidget {
  static const String routeName = 'OfferScreen';

  const OffersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Offers'),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, PlaceDetailsScreen.routeName);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: OfferBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/styles/colors.dart';
import 'offer_body.dart';

class OffersScreen extends StatelessWidget {
  static const String routeName = 'OfferScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              18,
            ),
            bottomRight: Radius.circular(
              18,
            ),
          ),
        ),
        title: Text(
          'Offers',
          style: TextStyle(
            fontSize: 17.5,
          ),
        ),
      ),
      body: OfferBody(),
    );
  }
}

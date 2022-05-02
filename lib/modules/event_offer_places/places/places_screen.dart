import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import 'listViewOfPlaces.dart';

class PlacesScreen extends StatelessWidget {
  static const String routeName = 'PlacesScreen';

  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              16.0,
            ),
            bottomRight: Radius.circular(
              16.0,
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        title: const Text(
          'Places',
        ),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: ListViewOfPlaces(),
    );
  }
}

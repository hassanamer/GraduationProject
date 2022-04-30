import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import 'listViewOfPlaces.dart';

class PlaceScreen extends StatelessWidget {
  static const String routeName = 'PlaceScreen';

  const PlaceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Places'),
        backgroundColor: AppColors.primaryColor,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListViewOfPlaces(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/textStyle.dart';

class PlaceDetailsScreen extends StatelessWidget {
  static const routeName = 'PlaceDetailsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
   child:  textStyle.normal('PlaceDetailsScreen', 14),
      ) );
  }
}

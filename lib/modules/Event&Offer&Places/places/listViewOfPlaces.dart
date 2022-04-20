import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/places/placesBody.dart';

class ListViewOfPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return PlacesBody(
            'name of place', 'some details', 'assets/images/img.png');
      },
    );
  }
}

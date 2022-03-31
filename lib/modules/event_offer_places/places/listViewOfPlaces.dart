import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/event_offer_places/places/placesBody.dart';
class ListViewOfPlaces extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(itemCount: 10 ,itemBuilder: (context, index) {
      return  PlacesBody('name of place','some details','assets/images/img.png');

    },),);
  }
}

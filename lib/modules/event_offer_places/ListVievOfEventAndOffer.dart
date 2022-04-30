import 'package:flutter/material.dart';
import 'eventAndOfferBody.dart';
//test

class ListVievOfEventAndOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return eventAndOfferBody(
            'name of place', 'some details', 'assets/images/img.png');
      },
    );
  }
}

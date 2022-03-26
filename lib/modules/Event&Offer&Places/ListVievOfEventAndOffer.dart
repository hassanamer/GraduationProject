import 'package:flutter/material.dart';
import 'eventAndOfferBody.dart';
class ListVievOfEventAndOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: ListView.builder(itemCount: 10 ,itemBuilder: (context, index) {
      return  eventAndOfferBody('name of place','some details','assets/images/img.png');

    },),);
  }
}


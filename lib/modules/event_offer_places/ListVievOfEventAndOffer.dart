import 'package:flutter/material.dart';
import 'eventAndOfferBody.dart';

class ListVievOfEventAndOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return eventAndOfferBody();
      },
    );
  }
}

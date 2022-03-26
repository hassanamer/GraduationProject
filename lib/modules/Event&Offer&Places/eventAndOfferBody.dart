import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/textStyle.dart';

class eventAndOfferBody extends StatelessWidget {
  final String hidder;
  final String someDetails;

  eventAndOfferBody(this.hidder, this.someDetails, this.pathOfImage);

  final String pathOfImage;
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column
          (
          children: [
            Row(
              children: [ SizedBox(width: 20,),
                Align(alignment: Alignment.centerLeft,child: textStyle(hidder, 22,FontWeight.bold, )),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textStyle.normal('someDetails', 16),SizedBox(width: 40,),


                ]
            ),
            Container(margin: EdgeInsets.all(8),child: Image.asset(pathOfImage),)
            ,Row(mainAxisAlignment:MainAxisAlignment.end,children:[Icon(Icons.assistant_navigation,color: Theme.of(context).primaryColor),
              SizedBox(width: 5,),
        textStyle.normal('see Details',14),SizedBox(width: 30,)])
            ,

          ],
        ),
      ),);
  }
}

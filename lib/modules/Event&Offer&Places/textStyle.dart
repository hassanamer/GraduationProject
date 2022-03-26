import 'package:flutter/material.dart';
class textStyle extends StatelessWidget {
  late String text;
  late double textSize;

  textStyle.normal(this.text,this.textSize);

  textStyle(this.text, this.textSize,
      this.fontWeight);

  FontWeight fontWeight = FontWeight.bold;
  @override
  Widget build(BuildContext context) {
    return Container(child:Text(text,style:TextStyle(fontSize: textSize,color: Theme.of(context).primaryColor,fontWeight: fontWeight ) ));
  }
}

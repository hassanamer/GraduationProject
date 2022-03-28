
import 'package:flutter/material.dart';

class RegisterContainer extends StatelessWidget {

  String text;
  late String path;
  RegisterContainer(this.text,);
  @override
  Widget build(BuildContext context) {
    return Column(
        children:[ Container(padding:EdgeInsets.symmetric(horizontal: 24,vertical: 8),decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
          child: Row(
            children: [
              Expanded(child: Container(child: TextField(decoration: InputDecoration(hintText: text),cursorWidth: 15,showCursor: false,),))
            ],
          ),
        ),

          SizedBox(height: 12,)
        ]

    );
  }
}

import 'package:flutter/material.dart';

import 'SignUpScreen.dart';

class SignUpButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 8, horizontal: 80),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all((Colors.transparent)
            )),
        onPressed: () {
          showModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Container(
                    height:double.infinity,decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: Colors.white) ,
                    child:SignUpScreen());
              });
        },
        child: Text('Sign Up'),
      ),);
  }
}

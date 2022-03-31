import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/register_container.dart';
import 'package:smarttouristguide/shared/styles/textStyle.dart';

class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          RegisterContainer('Email Address'),
          RegisterContainer(('Password')),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()),);
            }, child: textStyle.normal('Forget Password?', 13.5)
            )
            ],),
          Spacer(),
          Container(
            margin:
            EdgeInsets.symmetric(vertical: 8, horizontal: 80),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme
                    .of(context)
                    .primaryColor),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                      Colors.transparent)),
              onPressed: () {},
              child: Text('Login'),
            ),
          )
        ],),
    )
    ;
  }
}

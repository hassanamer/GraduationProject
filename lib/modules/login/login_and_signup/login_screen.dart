import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/register_container.dart';
import 'package:smarttouristguide/shared/styles/buttons_style.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPassword()),
                    );
                  },
                  child: textStyle.normal('Forget Password?', 13.5))
            ],
          ),
          Spacer(),
          button(
              function: () {
                {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                }
              },
              text: 'Login')
        ],
      ),
    );
  }
}

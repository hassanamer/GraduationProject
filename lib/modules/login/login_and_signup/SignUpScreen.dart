import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/registerContinarWithSpacer.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/register_container.dart';
import 'package:smarttouristguide/shared/styles/buttons_style.dart';

import '../../home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                children: [
                  RegisterContainer('First Name'), SizedBox(width: 24),
                  RegisterContainer('Last Name'),
                  RegisterContainer('Email Address'),
                  RegisterContainer(('Password')),
                  RegisterContainer(('Confirm Password')),
                  RegisterContainer('phone number'),
                  RegisterContainer('Date of Birth'),
                  registerContinarWithSpacer('Gender'),
                  registerContinarWithSpacer('Country'),
                  buttons(function: (){{Navigator.of(context).pushNamed(
                      HomeScreen.routeName
                  );}}, text: 'Submit')
                ],
              ),
            ),
          ), //buttons('submit')
        ],
      ),
    );
  }
}

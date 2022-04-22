import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/register_container.dart';
import 'package:smarttouristguide/shared/styles/buttons_style.dart';
import 'package:smarttouristguide/shared/styles/textStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 70),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).primaryColor),
              child: button(
                function: () {
                  {
                    Navigator.of(context).pushNamed(HomeScreen.routeName);
                  }
                },
                text: AppLocalizations.of(context)!.login,
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/register_container.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/textStyle.dart';

import '../../../shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
//   static const String routeName = 'loginScreen';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
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
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 80),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryColor),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {},
              child: const Text('Login'),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'LoginButton.dart';
import 'SignUpButton.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo2.png'),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('We Hope You Find A Destination '),
                      Text('Make You Happy '),
                    ],
                  ),
                ),
              ),
              SignUpButton(),
              LoginButton()
              // buttons('Login', DoFunction)
            ],
          ),
        ),
      ),
    );
  }
}

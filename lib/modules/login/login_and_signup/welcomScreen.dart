import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/buttons_style.dart';

import 'LoginButton.dart';
import 'SignUpButton.dart';
import 'SignUpScreen.dart';
import 'login_screen.dart';

class Welcome extends StatelessWidget {
  static const routeName = 'welcom';
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
              buttons(function: (){
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
              }, text: 'Sign Up'),
             buttons(function: (){{
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
                         child:
                         LoginScreen());
                   });
             }}, text: 'Login')
              // buttons('Login', DoFunction)
            ],
          ),
        ),
      ),
    );
  }
}

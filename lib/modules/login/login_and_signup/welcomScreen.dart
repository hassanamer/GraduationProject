import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/SignUpScreen.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/login_screen.dart';
import 'LoginButton.dart';
class Welcome extends StatelessWidget {
  static const String routeName = 'welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo2.png'),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('We Hope You Find A Destination '),
                    const Text('Make You Happy '),
                  ],
                ),
              ),
            ),
          LoginAndSignUpButton(SignUpScreen(),'SignUp'),
            LoginAndSignUpButton(LoginScreen(),'Login'),
            const SizedBox(
              height: 60,
            )
            // buttons('Login', DoFunction)
          ],
        ),
      ),
    );
  }
}

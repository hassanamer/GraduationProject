import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';

import '../login/login_and_signup/LoginAndSignUpButton.dart';
import '../login/login_and_signup/login_screen.dart';
import '../login/login_and_signup/register_screen.dart';

class Welcome extends StatelessWidget {
  static const String routeName = 'Welcome';

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Image.asset(
                'assets/images/logo2.png',
              ),
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
              const Text(
                'We Hope You Find A Destination\nMake You Happy',
                textAlign: TextAlign.center,
              ),
              LoginAndSignUpButton(RegisterScreen(),'SignUp'),
              LoginAndSignUpButton(LoginScreen(),'Login'),

            ],
          ),
        );
      },
    );
  }


}

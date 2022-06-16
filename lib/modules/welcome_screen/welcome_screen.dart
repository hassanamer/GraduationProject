import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import '../../shared/components/components.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';

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
              const SizedBox(
                height: 73,
              ),
              Image.asset(
                'assets/images/logo.png',
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'We Hope You Find A Destination\nMake You Happy',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.0,
              ),
              login_register_button(
                  context, RegisterScreen(), 'Register', Color(0x81005764)),
              login_register_button(
                  context, LoginScreen(), 'Login', AppColors.primaryColor),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLoginCubit.get(context);

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
              MaterialButton(
                color: AppColors.buttonTwoColor,
                height: 49,
                minWidth: 160,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  'Login',
                ),
                textColor: AppColors.primaryColor,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => cubit.BmSheet,
                  );
                },
              ),
              // buttons('Login', DoFunction)
            ],
          ),
        );
      },
    );
  }


}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = 'ForgetPassword';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {
        if (state is AppResetPasswordSuccessState) {
          if (state.resetPasswordModel!.status) {
            showToast(
              message: 'DONE, Check your mail',
              state: ToastStates.SUCCESS,
            );
          }
        } else if (state is AppResetPasswordErrorState) {
          showToast(
            message: 'ERROR, Try again',
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (context, state) {
        var EmailResetController = TextEditingController();
        var cubit = AppLoginCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            foregroundColor: AppColors.primaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Enter your registered email below\nto receive password reset instructions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.disabledAndHintColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/email.png',
                    height: 140.0,
                    width: 140.0,
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Positioned(
                  left: 20.0,
                  right: 20.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Form(
                      key: cubit.resetPasswordKey,
                      child: TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Email cannot be blank' : null,
                        controller: EmailResetController,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(fontSize: 15),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Positioned(
                  right: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 14.5),
                        ),
                        onPressed: () {
                          if (cubit.resetPasswordKey.currentState!.validate()) {
                            cubit.resetPassword(
                              email: EmailResetController.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget fieldone() => Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.email_rounded,
            size: 20.0,
          ),
        ),
        onChanged: (value) {},
      ),
    );

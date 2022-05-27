import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import '../../layout/cubit/states.dart';
import '../../shared/styles/colors.dart';
import '../login/login_cubit/cubit.dart';
import '../login/login_cubit/states.dart';

class ChangePassword extends StatelessWidget {
  var oldPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppChangePasswordSuccessState) {
          showToast(message: '${state.changePasswordModel!.success}');
        } else if (state is AppChangePasswordErrorState) {
          showToast(message: 'Error changing password');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: AppColors.primaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  SizedBox(
                    height: 45.0,
                  ),
                  Text(
                    'Change your password',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    radius: 70,
                    child: Icon(
                      Icons.lock,
                      size: 100,
                      color: Colors.white,
                    ),
                  )),
                  SizedBox(
                    height: 35.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Form(
                      key: cubit.changePasswordKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: cubit.isPassword,
                            validator: (String? value) {
                              if (value != null && value.trim().length >= 6) {
                                return null;
                              } else {
                                return "Please enter 6 characters at least.";
                              }
                            },
                            controller: oldPasswordController,
                            decoration: InputDecoration(
                              hintText: 'Old password',
                              hintStyle: TextStyle(fontSize: 15),
                              prefixIcon: Icon(
                                Icons.lock_open,
                                size: 25.0,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                icon: Icon(
                                  cubit.suffix,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: cubit.isPassword,
                            validator: (String? value) {
                              if (value != null && value.trim().length >= 6) {
                                return null;
                              } else {
                                return "Please enter 6 characters at least.";
                              }
                            },
                            controller: newPasswordController,
                            decoration: InputDecoration(
                              hintText: 'New password',
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 25.0,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                icon: Icon(
                                  cubit.suffix,
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: cubit.isPassword,
                            validator: (String? value) {
                              if (value != null && value.trim().length >= 6) {
                                return null;
                              } else if(value != newPasswordController.text) {return "Password don't match!"; } else {
                                return "Please enter 6 characters at least.";
                              }
                            },
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                                hintText: 'Confirm new password',
                                hintStyle: TextStyle(fontSize: 15),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 25.0,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.changePasswordVisibility();
                                  },
                                  icon: Icon(
                                    cubit.suffix,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
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
                          if (cubit.changePasswordKey.currentState!.validate()) {
                            cubit.changePassword(
                              oldPassword: oldPasswordController.text,
                              newPassword: newPasswordController.text,
                              newPasswordConfirmation: confirmPasswordController.text,
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

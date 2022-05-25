import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/styles/colors.dart';
import '../login/login_cubit/cubit.dart';
import '../login/login_cubit/states.dart';

class ChangePassword extends StatelessWidget {
  var ConfirmPassword = TextEditingController();
  var NowPassword = TextEditingController();
  var OldPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppLoginCubit.get(context);
    return BlocConsumer<AppLoginCubit, AppLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: AppColors.primaryColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
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
                          child: Column(children: [
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
                              controller: OldPassword,
                              decoration: InputDecoration(
                                  hintText: 'New Password',
                                  hintStyle: TextStyle(fontSize: 15),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock_open,
                                    size: 28.0,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(cubit.suffix),
                                  )),
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
                              controller: OldPassword,
                              decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(fontSize: 15),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 28.0,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(cubit.suffix),
                                  )),
                            ),
                            SizedBox(
                              height: 15.0,
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
                              controller: OldPassword,
                              decoration: InputDecoration(
                                  hintText: 'Old Password',
                                  hintStyle: TextStyle(fontSize: 15),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 28.0,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                    icon: Icon(cubit.suffix),
                                  )),
                            ),
                          ]),
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
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

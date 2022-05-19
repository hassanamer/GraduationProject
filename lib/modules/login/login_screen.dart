import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smarttouristguide/shared/styles/textStyle.dart';

import '../../AskUser.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppLoginCubit.get(context);
    var appCubit = AppCubit.get(context);
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {
        if (state is AppLoginSuccessState) {
          if (state.loginModel!.status) {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel!.data.token,
            ).then((value) {
              cubit.getToken();
              appCubit.getProfile();
              appCubit.getHomeData();
              appCubit.getFavorites();
              navigateAndFinish(
                context: context,
                widget: AppLayout(),
              );
            });
            Fluttertoast.showToast(
              msg: "${state.loginModel!.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            showToast(
              message: AppLocalizations.of(context)!.login_success,
              state: ToastStates.ERROR,
            );
          }
        } else if (state is AppLoginErrorState) {
          showToast(
            message: AppLocalizations.of(context)!.login_error,
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (context, state) {

        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return "Please enter valid email.";
                      }
                    },
                    label: 'Email Address',
                    radius: 10,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    isPassword: cubit.isPassword,
                    validate: (String? value) {
                      if (value != null && value.trim().length >= 3) {
                        return null;
                      } else {
                        return "Please enter 3 characters at least.";
                      }
                    },
                    label: 'Password',
                    suffix: cubit.suffix,
                    suffixPressed: () {
                      cubit.changePasswordVisibility();
                    },
                    radius: 10,
                    onSubmit: (value) {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.userLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primaryColor),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          Navigator.pushNamed(context, AskUser.routeName);
                        },
                        child: Text('select your favourite category'),
                      )),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.09,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //       color: Colors.grey),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Text('select your favourite category'),
                  //       DropdownButton<String>(
                  //         iconEnabledColor: Theme.of(context).primaryColor,
                  //         // isExpanded: true,
                  //         items:
                  //             <String>['A', 'B', 'C', 'D'].map((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //         onChanged: (_) {},
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, ForgetPassword.routeName);
                        },
                        child: textStyle.normal('Forget Password?', 13.5),
                      ),
                    ],
                  ),
                  Spacer(),
                  ConditionalBuilder(
                    condition: state is! AppLoginLoadingState,
                    builder: (context) => button(
                      text: 'login',
                      function: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import '../../shared/components/components.dart';

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
              appCubit.getHomeData();
              appCubit.getCategoriesPlacesData();
              appCubit.getFavorites();
              appCubit.getProfile();
              appCubit.getInterests();
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
              message: 'Logged in successfully',
              state: ToastStates.ERROR,
            );
          }
        } else if (state is AppLoginErrorState) {
          showToast(
            message: 'Please enter correct data!',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, ForgetPassword.routeName);
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ConditionalBuilder(
                    condition: state is! AppLoginLoadingState,
                    builder: (context) => button(
                      text: 'Login',
                      textSize: 16.0,
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
                        Center(child: CircularProgressIndicator(),),
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

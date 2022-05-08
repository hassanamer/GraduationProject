import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/app_layout.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/forget_password.dart';
import 'package:smarttouristguide/modules/login/login_cubit/cubit.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import '../../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = AppLoginCubit.get(context);
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<AppLoginCubit, AppLoginStates>(
      listener: (context, state) {
        if (state is AppLoginSuccessState)
        {
          if (state.loginModel!.status)
          {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel!.data.token,
            ).then((value) {
              cubit.getToken();

              navigateAndFinish(
                context: context,
                widget: AppLayout(),
              );
            });
            showToast(
              message: AppLocalizations.of(context)!.login_success,
              state: ToastStates.SUCCESS,
            );
          } else {
          }
        } else if(state is AppLoginErrorState) {
          showToast(
            message: AppLocalizations.of(context)!.login_error,
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: AppColors.disabledAndHintColor,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            cubit.changeBottomSheet();
                          },
                        ),
                        SizedBox(
                          width: 85.0,
                        ),
                        TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            cubit.changeBottomSheet();
                          },
                        ),
                      ],
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
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
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      label: 'Password',
                      suffix: cubit.suffix,
                      suffixPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      prefix: Icons.lock_outlined,
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
                    ConditionalBuilder(
                      condition: state is! AppLoginLoadingState,
                      builder: (context) => defaultButton(
                        background: AppColors.primaryColor,
                        text: 'login',
                        isUpperCase: true,
                        function: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        radius: 10,
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            navigateTo(
                              widget: ForgetPassword(),
                              context: context,
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forgot_password,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

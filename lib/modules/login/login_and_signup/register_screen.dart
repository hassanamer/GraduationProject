import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/layout/app_layout.dart';

import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/buttons_style.dart';
import '../register_cubit/cubit.dart';
import '../register_cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  bool hidePassword = true;

  final TextEditingController email = TextEditingController(),
      password = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController(),
      ConfirmPassword = TextEditingController(),
      phoneNumber = TextEditingController(),
      DateOfBirth = TextEditingController(),
      Gender = TextEditingController(),
      Country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppRegisterCubit.get(context);

    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {
        if (state is AppRegisterSuccessState) {
          if (state.RegisterModel!.status!) {
            CacheHelper.saveData(
                    key: 'token', value: state.RegisterModel!.data!)
                .then((value) {
              navigateAndFinish(
                context: context,
                widget: AppLayout(),
              );
            });
            Fluttertoast.showToast(
              msg: "${state.RegisterModel!.message!}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            showToast(
              message: "${state.RegisterModel!.message!}",
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return Column(children: [
          Expanded(
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
                  child: ListView(children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: firstName,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value != null && value.trim().length >= 3) {
                          return null;
                        } else {
                          return "Please enter 3 characters at least.";
                        }
                      },
                      label: 'First Name',
                      radius: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: lastName,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value != null && value.trim().length >= 3) {
                          return null;
                        } else {
                          return "Please enter 3 characters at least.";
                        }
                      },
                      label: 'Last Name',
                      radius: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: email,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            EmailValidator.validate(value)) {
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
                      controller: password,
                      type: TextInputType.visiblePassword,
                      isPassword: cubit.isPassword,
                      validate: (String? value) {
                        if (value != null && value.trim().length >= 6) {
                          return null;
                        } else {
                          return "Please enter 6 characters at least.";
                        }
                      },
                      label: 'Password',
                      suffix: cubit.suffix,
                      suffixPressed: () {
                        cubit.changePasswordVisibility();
                      },
                      radius: 10,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: phoneNumber,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value != null && value.trim().length == 11) {
                          return null;
                        } else {
                          return "Please enter 11 number.";
                        }
                      },
                      label: 'Phone Number',
                      radius: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: DateOfBirth,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value != null) {
                          return null;
                        } else {
                          return "Please enter your date of birth . ";
                        }
                      },
                      label: 'Date Of Birth',
                      radius: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: Gender,
                      // type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value != null) {
                          return null;
                        } else {
                          return "please choice . ";
                        }
                      },
                      label: 'Gender',

                      radius: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      controller: Country,
                      type: TextInputType.text,
                      validate: (String? value) {
                        if (value != null) {
                          return null;
                        } else {
                          return "please choice. ";
                        }
                      },
                      label: 'Country',
                      onSubmit: (value) {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.userRegister(
                              firstname: firstName.text,
                              lastName: lastName.text,
                              email: email.text,
                              password: password.text,
                              phoneNumber: phoneNumber.text,
                              DateOfBirth: DateOfBirth.text,
                              Gender: Gender.text,
                              country: Country.text);
                        }
                      },
                      radius: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: state is! AppLoginLoadingState,
                      builder: (context) => button(
                        text: 'Submit',
                        function: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userRegister(
                                firstname: firstName.text,
                                lastName: lastName.text,
                                email: email.text,
                                password: password.text,
                                phoneNumber: phoneNumber.text,
                                DateOfBirth: DateOfBirth.text,
                                Gender: Gender.text,
                                country: Country.text);
                          }
                        },
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ]),
                ),
              ),
            ),
          )
        ]);
      },
    );
  }
}

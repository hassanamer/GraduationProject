import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/modules/register/register_cubit/cubit.dart';
import 'package:smarttouristguide/modules/register/register_cubit/states.dart';
import '../../shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController(),
        password = TextEditingController(),
        first_name = TextEditingController(),
        last_name = TextEditingController(),
        ConfirmPassword = TextEditingController(),
        phone = TextEditingController(),
        date_of_birth = TextEditingController(),
        gender = TextEditingController(),
        country = TextEditingController(),
        username = TextEditingController();

    var cubit = AppRegisterCubit.get(context);

    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {
        if (state is AppRegisterSuccessState) {
          if (state.registerModel!.status) {
            Fluttertoast.showToast(
              msg: "${state.registerModel!.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            showToast(
              message: "${state.registerModel!.message}",
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
                      controller: first_name,
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
                      controller: last_name,
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
                      controller: username,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value != null && value.trim().length >= 3) {
                          return null;
                        } else {
                          return "Please enter 3 characters at least.";
                        }
                      },
                      label: 'User Name',
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
                      controller: ConfirmPassword,
                      type: TextInputType.visiblePassword,
                      isPassword: cubit.isPassword,
                      validate: (String? value) {
                        if (value != null && value.trim().length >= 6) {
                          return null;
                        } else {
                          return "Please enter 6 characters at least.";
                        }
                      },
                      label: 'Confirm Password',
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
                      controller: phone,
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
                      controller: date_of_birth,
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
                      controller: gender,
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
                      controller: country,
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
                              username: username.text,
                              first_name: first_name.text,
                              last_name: last_name.text,
                              email: email.text,
                              password: password.text,
                              phone: phone.text,
                              date_of_birth: date_of_birth.text,
                              gender: gender.text,
                              country: country.text);
                        }
                      },
                      radius: 10,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: state is! AppRegisterLoadingState,
                      builder: (context) => button(
                        text: 'Submit',
                        function: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userRegister(
                                username: username.text,
                                first_name: first_name.text,
                                last_name: last_name.text,
                                email: email.text,
                                password: password.text,
                                phone: phone.text,
                                date_of_birth: date_of_birth.text,
                                gender: gender.text,
                                country: country.text);
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

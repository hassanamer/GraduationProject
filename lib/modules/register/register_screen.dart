import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/modules/interest_screen.dart';
import 'package:smarttouristguide/modules/register/register_cubit/cubit.dart';
import 'package:smarttouristguide/modules/register/register_cubit/states.dart';
import 'package:smarttouristguide/shared/components/extensions.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import '../../shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var password = TextEditingController();
    var first_name = TextEditingController();
    var last_name = TextEditingController();
    var ConfirmPassword = TextEditingController();
    var phone = TextEditingController();
    var date_of_birth = TextEditingController();
    var gender = TextEditingController();
    var countryController = TextEditingController();
    var username = TextEditingController();

    var cubit = AppRegisterCubit.get(context);
    var appCubit = AppCubit.get(context);

    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {
        if (state is AppRegisterSuccessState) {
          if (state.registerModel!.status) {
            CacheHelper.saveData(
              key: 'token',
              value: state.registerModel!.data.token,
            ).then((value) {
              cubit.getToken();
              appCubit.getProfile();
              appCubit.getHomeData();
              appCubit.getCategoriesPlacesData();
              appCubit.getFavorites();
              appCubit.getInterests();
              navigateAndFinish(
                context: context,
                widget: InterestsScreen(),
              );
            });
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
        final List<String> genderItems = [
          'Male',
          'Female',
        ];

        String? selectedValue;

        return Column(
          children: [
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
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            controller: first_name,
                            type: TextInputType.name,
                            validate: (String? value) {
                              if (value != null && value.trim().length >= 3) {
                                return null;
                              } else {
                                return "Please enter 3 characters at least.";
                              }
                            },
                            label: 'First Name',
                            radius: 14,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: last_name,
                            type: TextInputType.name,
                            validate: (String? value) {
                              if (value != null && value.trim().length >= 3) {
                                return null;
                              } else {
                                return "Please enter 3 characters at least.";
                              }
                            },
                            label: 'Last Name',
                            radius: 14,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: username,
                            type: TextInputType.name,
                            validate: (String? value) {
                              if (value != null && value.trim().length >= 3) {
                                return null;
                              } else {
                                return "Please enter 3 characters at least.";
                              }
                            },
                            label: 'User Name',
                            radius: 14,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: emailController,
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
                            radius: 14,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            controller: ConfirmPassword,
                            type: TextInputType.visiblePassword,
                            isPassword: cubit.isPassword,
                            validate: (String? value) {
                              if (value != null &&
                                  value.trim().length >= 6 &&
                                  value == password.text) {
                                return null;
                              } else if (value!.isEmpty) {
                                return 'Name field is required';
                              } else if (value != password.text) {
                                return 'Password Don\'t Match';
                              }
                            },
                            label: 'Confirm Password',
                            suffix: cubit.suffix,
                            suffixPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            radius: 14,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            controller: phone,
                            type: TextInputType.phone,
                            validate: (String? value) {
                              if (value != null && value.trim().length == 11) {
                                return null;
                              } else {
                                return "Please enter 11 number.";
                              }
                            },
                            label: 'Phone Number',
                            radius: 14,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: date_of_birth,
                            type: TextInputType.datetime,
                            validate: (String? value) {
                              if (value != null) {
                                return null;
                              } else {
                                return "Please enter your date of birth . ";
                              }
                            },
                            label: 'Date Of Birth',
                            radius: 14,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime(2006),
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now(),
                              ).then(
                                (value) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd').format(value!);
                                  date_of_birth.text = formattedDate;
                                  print(date_of_birth.text.toString());
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 27),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Select Your Gender',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 30,
                            buttonHeight: 55,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            items: genderItems
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                            },
                            onChanged: (value) {
                              gender.text = value.toString().toLowerCase();
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: countryController,
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (value != null) {
                                return null;
                              } else {
                                return "please choice. ";
                              }
                            },
                            label: 'Country',
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                onSelect: (Country country) {
                                  countryController.text = country.name;
                                },
                                exclude: <String>['IL'],
                                countryListTheme: CountryListThemeData(
                                  borderRadius: BorderRadius.circular(14),
                                  backgroundColor: AppColors.backgroundColor,
                                  bottomSheetHeight: 400,
                                  textStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              );
                            },
                            onSubmit: (value) {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.userRegister(
                                  username: username.text,
                                  first_name: first_name.text.capitalize(),
                                  last_name: last_name.text.capitalize(),
                                  email: emailController.text,
                                  password: password.text,
                                  phone: phone.text,
                                  date_of_birth: date_of_birth.text,
                                  gender: gender.text,
                                  country: countryController.text,
                                );
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
                                    first_name: first_name.text.capitalize(),
                                    last_name: last_name.text.capitalize(),
                                    email: emailController.text,
                                    password: password.text,
                                    phone: phone.text,
                                    date_of_birth: date_of_birth.text,
                                    gender: gender.text,
                                    country: countryController.text,
                                  );
                                }
                              },
                            ),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

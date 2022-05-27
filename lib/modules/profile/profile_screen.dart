import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/get_profile_model.dart';
import 'package:smarttouristguide/modules/profile/change_password.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/components/extensions.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var genderController = TextEditingController();
  var countryController = TextEditingController();
  var emailController = TextEditingController();

  static const String routeName = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return ConditionalBuilder(
          condition: cubit.getProfileModel != null,
          builder: (context) => currentt(context, cubit.getProfileModel!.data),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }

  Widget currentt(context, Data user) {
    firstNameController.text = user.firstName.capitalize();
    lastNameController.text = user.lastName.capitalize();
    nameController.text = user.username;
    dateOfBirthController.text = user.dateOfBirth;
    genderController.text = user.gender;
    phoneController.text = user.phone;
    countryController.text = user.country;
    emailController.text = user.email;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 17.5,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColors.primaryColor,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: AppColors.backgroundColor,
                ),
                flex: 4,
              ),
            ],
          ),
          Positioned(
            top: 41.0,
            left: 20.0,
            right: 20.0,
            child: Card(
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 55.0,
                        backgroundImage: user.gender == 'male'
                            ? AssetImage(
                                'assets/images/male.png',
                              )
                            : AssetImage(
                                'assets/images/female.png',
                              ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              '${user.firstName.capitalize()} ${user.lastName.capitalize()}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              '@${user.username}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.322,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    UserDataField(
                      controller: firstNameController,
                      icon: Icons.person_rounded,
                      width: 150,
                    ),
                    Spacer(),
                    UserDataField(
                      controller: lastNameController,
                      icon: Icons.person_rounded,
                      width: 150,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  controller: nameController,
                  icon: Icons.account_circle_rounded,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  icon: Icons.cake_rounded,
                  controller: dateOfBirthController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  icon: Icons.male_rounded,
                  controller: genderController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  icon: Icons.phone_rounded,
                  controller: phoneController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  icon: Icons.language_rounded,
                  controller: countryController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  controller: emailController,
                  icon: Icons.email_rounded,
                  readOnly: true,
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
                      textColor: Colors.white,
                      color: AppColors.primaryColor,
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_rounded,
                            size: 19.5,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            'Change Password',
                          ),
                        ],
                      ),
                      onPressed: () {
                        navigateTo(
                          context: context,
                          widget: ChangePassword(),
                        );
                      },
                    ),
                    Spacer(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      textColor: Colors.white,
                      color: AppColors.primaryColor,
                      child: Text('Update'),
                      onPressed: () {
                        AppCubit.get(context).updateProfile(
                          firstName: firstNameController.text.capitalize(),
                          lastName: lastNameController.text.capitalize(),
                          userName: nameController.text,
                          birthday: dateOfBirthController.text,
                          gender: genderController.text,
                          phone: phoneController.text,
                          country: countryController.text,
                          email: emailController.text,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget UserDataField({
    required IconData icon,
    controller,
    double width = double.infinity,
    bool readOnly = false,
  }) =>
      Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              size: 20,
            ),
          ),
          onChanged: (value) {},
        ),
      );
}

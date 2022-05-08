import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/get_profile_model.dart';
import 'package:smarttouristguide/shared/components/extensions.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:smarttouristguide/shared/styles/textStyle.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
}

Widget currentt(context, Data user) => Scaffold(
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
            top: MediaQuery.of(context).size.height * 0.02,
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
                        backgroundImage: AssetImage('assets/testpic.jpg'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              '${user.firstName.toUpperCase()} ${user.lastName.toUpperCase()}',
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
            top: MediaQuery.of(context).size.height * 0.35,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDataField(data: user.dateOfBirth, icon: Icons.cake_rounded),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(data: user.gender.capitalize(), icon: Icons.male_rounded),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(data: user.phone, icon: Icons.phone_rounded),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(data: user.country, icon: Icons.language_rounded),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(data: user.email, icon: Icons.email_rounded),
              ],
            ),
          ),
        ],
      ),
    );

Widget UserDataField({required String data, required IconData icon}) =>
    Container(
      width: double.infinity,
      height: 40,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 5.0,
          ),
          Icon(
            icon,
            color: AppColors.primaryColor,
            size: 20,
          ),
          Text('    ${data}'),
        ],
      ),
    );

Widget old(context) => Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              16,
            ),
            bottomRight: Radius.circular(
              16,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 17.5,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70.0,
                            backgroundImage: AssetImage('assets/testpic.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Form(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 80.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.person_pin,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: textStyle(
                                  'Hassan Mohamed ', 20.0, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.email_rounded,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: textStyle('hassanamer281@gmail.com ', 20.0,
                                  FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.lock,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: textStyle(
                                  '**************** ', 20.0, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.date_range,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70.0),
                              child: textStyle(
                                  '30 / 4 / 2022 ', 20.0, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.language_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: textStyle('Egypt', 20.0, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.phone,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 70.0),
                              child: textStyle(
                                  '01111302839', 20.0, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 18,
                        width: MediaQuery.of(context).size.width - 80.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.male_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 90.0),
                              child: textStyle('Male', 20.0, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

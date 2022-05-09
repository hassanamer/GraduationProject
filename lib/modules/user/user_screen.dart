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

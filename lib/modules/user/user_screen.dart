import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/get_profile_model.dart';
import 'package:smarttouristguide/shared/components/extensions.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class UserProfile extends StatelessWidget {
  static const String routeName = 'UserProfile';

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

Widget currentt(context, Data user) {

  var cubit = AppCubit.get(context);

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
          child: Form(
            key: AppCubit.get(context).editProfileKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDataField(
                  data: user.dateOfBirth,
                  icon: Icons.cake_rounded,
                  controller: cubit.dateOfBirthController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  data: user.gender.capitalize(),
                  icon: Icons.male_rounded,
                  controller: cubit.genderController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  data: user.phone,
                  icon: Icons.phone_rounded,
                  controller: cubit.phoneController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  data: user.country,
                  icon: Icons.language_rounded,
                  controller: cubit.countryController,
                ),
                SizedBox(
                  height: 5.0,
                ),
                UserDataField(
                  data: user.email,
                  icon: Icons.email_rounded,
                ),
                MaterialButton(
                  onPressed: () {
                    if (cubit.editProfileKey.currentState!.validate()) {
                      print('ok');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget UserDataField(
        {required String data, required IconData icon,controller}) =>
    Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: '${data}',
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

// Container(
//   width: double.infinity,
//   height: 40,
//   color: Colors.white,
//   child: Row(
//     children: [
//       SizedBox(
//         width: 5.0,
//       ),
//       Icon(
//         icon,
//         color: AppColors.primaryColor,
//         size: 20,
//       ),
//       Text('    ${data}'),
//     ],
//   ),
// );

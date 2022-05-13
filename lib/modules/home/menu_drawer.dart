import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smarttouristguide/modules/user/user_screen.dart';
import 'package:smarttouristguide/shared/components/constants.dart';

import '../../layout/cubit/cubit.dart';
import '../../models/get_profile_model.dart';
import '../../shared/styles/colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) => ChangeColorCubit(),
      child: BlocConsumer<ChangeColorCubit, ChangesStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
              condition: cubit.getProfileModel != null,
              builder: (context) => currentt(
                context,
                cubit.getProfileModel!.data,
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            );
          }),
    );
  }
}

Widget currentt(context, Data user) => Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.46,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 55.0,
                                backgroundImage: user.gender == 'male'
                                    ? AssetImage(
                                        'assets/images/male.png',
                                      )
                                    : AssetImage(
                                        'assets/images/female.png',
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              '${user.username}',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            Text(
                              '${user.email}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(UserProfile.routeName);
                              },
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.mood,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontSize: 18),
            ),
            horizontalTitleGap: 80,
            leading: Switch(
              activeColor: AppColors.primaryColor,
              value: ChangeColorCubit.get(context).changeMode,
              onChanged: (value) {
                ChangeColorCubit.get(context).togaleMode();
              },
            ),
          ),
          ListTile(
              title: Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontSize: 18),
              ),
              horizontalTitleGap: 80,
              leading: Switch(
                  activeColor: AppColors.primaryColor,
                  value: ChangeColorCubit.get(context).changeLanguage,
                  onChanged: (value) {
                    ChangeColorCubit.get(context).togaleLanguage();
                    print(ChangeColorCubit().changeLanguage);
                  })),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryColor),
            child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: () {
                signOut(context);
              },
              child: Text(AppLocalizations.of(context)!.log_out),
            ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );

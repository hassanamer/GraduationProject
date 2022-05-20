import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smarttouristguide/modules/interest_screen.dart';
import 'package:smarttouristguide/shared/components/constants.dart';
import 'package:smarttouristguide/shared/components/extensions.dart';

import '../../layout/cubit/cubit.dart';
import '../../models/get_profile_model.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class MenuDrawerScreen extends StatelessWidget {
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

Widget currentt(context, Data user) => Container(
      width: MediaQuery.of(context).size.width * 0.78,
      child: Drawer(
        backgroundColor: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              18,
            ),
            topRight: Radius.circular(
              18,
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 230.0,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'ProfileScreen',
                  );
                },
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                radius: 40,
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
                                height: 10,
                              ),
                              Text(
                                '${user.firstName.capitalize()} ${user.lastName.capitalize()}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${user.email}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[350],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Text(
                    'Interests',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.5,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primaryColor,
                      size: 17.5,
                    ),
                    onPressed: () {
                      navigateTo(
                        context: context,
                        widget: InterestsScreen(),
                      );
                    },
                  )
                ],
              ),
            ),
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
      ),
    );

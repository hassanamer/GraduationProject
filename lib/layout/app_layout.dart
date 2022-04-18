import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: SvgPicture.asset('assets/icons/menu.svg'),
              onPressed: () {
                // Here will type function to open menu drawer
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: bottomNavBar(context),
        );
      },
    );
  }
}

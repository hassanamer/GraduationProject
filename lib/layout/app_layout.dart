import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/chat_bot/chat_bot_screen.dart';
import 'package:smarttouristguide/modules/home/menu_drawer.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../modules/profile/profile_screen.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          drawer: MenuDrawer(),
          appBar: AppBar(
            foregroundColor: AppColors.primaryColor,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  navigateTo(
                    context: context,
                    widget: ProfileScreen(),
                  );
                },
              )
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: bottomNavBar(
            context,
          ),
          floatingActionButton: DraggableFab(
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.contact_page_rounded,
              ),
              onPressed: () {
                navigateTo(
                  context: context,
                  widget: ChatBot(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

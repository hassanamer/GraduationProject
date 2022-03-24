import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/search/search_screen.dart';
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
            title: Text(
              'Smart Tourist Guide',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context: context,
                    widget: SearchScreen(),
                  );
                },
                icon: Icon(
                  Icons.search,
                ),
              )
            ],
          ),
          body: cubit.buttomScreens[cubit.currentIndex],
          bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x17000000),
                      spreadRadius: 5,
                      blurRadius: 28),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Colors.white,
                  elevation: 5.0,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeButtom(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/home.svg',
                        color: AppColors.primaryColor,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.apps,
                        size: 28.0,
                      ),
                      label: 'Categories',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        size: 28.0,
                      ),
                      label: 'Wish List',
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/user/user_screen.dart';
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
            leading: Icon(
              Icons.menu,
              color: Palette.primaryColor,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()),);},
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Palette.primaryColor,
                ),
              )
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
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
                    cubit.changeBottom(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        'assets/icons/active_home.svg',
                      ),
                      icon: SvgPicture.asset(
                        'assets/icons/home.svg',
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        'assets/icons/active_categories.svg',
                      ),
                      icon: SvgPicture.asset(
                        'assets/icons/categories.svg',
                      ),
                      label: 'Categories',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        'assets/icons/active_wishlist.svg',
                      ),
                      icon: SvgPicture.asset(
                        'assets/icons/wishlist.svg',
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

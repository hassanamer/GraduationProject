import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../layout/cubit/cubit.dart';

//default button (ex: Registration,Login, Submit)
Widget defaultButton({
  required double width,
  required Color background,
  required Function function,
  required String text,
  required ButtonStyle buttonStyle,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(color: AppColors.buttonTextColor),
        ),
      ),
    );

void navigateTo({required widget, required context}) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget bottomNavBar(context) {
  var cubit = AppCubit.get(context);
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Color(
            0x17000000,
          ),
          spreadRadius: 5,
          blurRadius: 28,
        ),
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
              'assets/icons/wishlist.svg',
            ),
            icon: SvgPicture.asset(
              'assets/icons/wishlist.svg',
            ),
            label: 'Wish List',
          ),
        ],
      ),
    ),
  );
}

Widget HomeRow({
  required double width,
  required String text,
  required String iconPath,

}) => Container(
  height: 39.0,
  width: width,
  decoration: BoxDecoration(
    color: Color(0xffffebc9),
    borderRadius: BorderRadius.circular(19.0,),
    boxShadow: [
      BoxShadow(
        color: Color(
          0x16000000,
        ),
        spreadRadius: 3,
        blurRadius: 6,
      ),
    ],
  ),
  child: Row(
    children: [
      SizedBox(
        width: 9.5,
      ),
      SvgPicture.asset(
        iconPath,
      ),
      const SizedBox(
        width: 7.5,
      ),
      Text(
        text.toUpperCase(),
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  ),
);
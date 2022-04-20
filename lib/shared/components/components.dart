import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../layout/cubit/cubit.dart';
import '../../modules/event_offer_places/places/iconOfRate.dart';

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
  required String text,
  required String iconPath,

}) => Container(
  height: 39.0,
  width: 299,
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

Widget HomeItem() => Container(
  height: 178.0,
  width: 148.0,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0,),
  ),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Center(
          child: Image.asset('assets/images/test.jpg',
              height: 112),
        ),
        Text(
          'Giza Pyramids',
          style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w600
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
          [
            rate(),
            rate(),
            rate(),
            rate(),
            rate(),
            Spacer(),
            SvgPicture.asset('assets/icons/goto.svg',)
          ],
        ),
      ],
    ),
  ),
);
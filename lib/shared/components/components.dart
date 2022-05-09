import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../layout/cubit/cubit.dart';
import '../../modules/event_offer/iconOfRate.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0,
  required String text,
  required VoidCallback function,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
//default button (ex: Registration,Login, Submit)
Widget default_Button({
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

void navigateTo({
  required context,
  required widget,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish({required widget, required context}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

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
        selectedItemColor: AppColors.primaryColor,
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
            icon: Icon(
              Icons.favorite,
              size: 30.0,
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
}) =>
    Container(
      height: 39.0,
      width: 299,
      decoration: BoxDecoration(
        color: Color(0xffffebc9),
        borderRadius: BorderRadius.circular(
          19.0,
        ),
        boxShadow: const [
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
      height: 200.0,
      width: 148.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/test.jpg', height: 112),
            ),
            Text(
              'Giza Pyramids',
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                rate(),
                rate(),
                rate(),
                rate(),
                rate(),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/goto.svg',
                )
              ],
            ),
          ],
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  TextInputType? type,
  ValueChanged? onSubmit,
  ValueChanged? onChanged,
  GestureTapCallback? onTap,
  required FormFieldValidator<String>? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isPassword = false,
  double radius = 0,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
          radius,
        )),
      ),
    );

void showToast({
  required String? message,
  ToastStates? state,
}) =>
    Fluttertoast.showToast(
      msg: "${message}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor:
          state == null ? AppColors.primaryColor : chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(ToastStates state) {
  Color? color;

  switch (state) {
    case (ToastStates.SUCCESS):
      color = Colors.green;
      break;
    case (ToastStates.ERROR):
      color = Colors.red;
      break;
    case (ToastStates.WARNING):
      color = Colors.amber;
      break;
  }
  return color;
}

Widget divider({double width = double.infinity}) => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Container(
        width: width,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

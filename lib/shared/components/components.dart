import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import '../../layout/cubit/cubit.dart';

Widget button({
  required VoidCallback? function,
  required String text,
  Color color = AppColors.primaryColor,
  Color textColor = Colors.white,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 80,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
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
        contentPadding: EdgeInsets.all(17),
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


Widget login_register_button(context, Screen, text) {
  return button(
      function: () {
        showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Screen,
            );
          },
        );
      },
      text: text);
}
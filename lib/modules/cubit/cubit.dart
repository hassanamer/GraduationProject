import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/cubit/states.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class ChangeColorCubit extends Cubit<ChangesStates> {
  ChangeColorCubit() : super(InitialFavoriteIconColorState());

  bool iconColor = true;
  Color x = AppColors.disabledAndHintColor;
  bool changeLanguage = false;
  bool changeMode = false;
  String? y;

  static ChangeColorCubit get(context) => BlocProvider.of(context);
  void changeColorIcon() {
    if (iconColor == true) {
      x = AppColors.primaryColor;
      emit(ChangeColorState());
      iconColor = false;
    } else {
      x = AppColors.disabledAndHintColor;

      emit(ChangeColorState1());
      iconColor = true;
    }

    emit(ChangeColorState());
  }

  void togaleLanguage() {
    if (changeLanguage == true) {
      y = 'en';

      emit(ChangeLanguage());
      changeLanguage = false;
    } else if (changeLanguage == false) {
      y = 'ar';
      emit(ChangeLanguage1());
      changeLanguage = true;
    }
    emit(ChangeLanguage());
    changeLanguage != changeLanguage;
  }

  void togaleMode() {
    if (changeMode == true) {
      emit(ChangeLanguage());
      changeMode = false;
    } else if (changeMode == false) {
      emit(ChangeLanguage1());
      changeMode = true;
    }
    emit(ChangeLanguage());
  }

  // bool isCheckBox = true;
  // IconData CheckBoxIcon = Icons.check_box_outline_blank_sharp;
  // void ChangeCheckBoxa() {
  //   isCheckBox = !isCheckBox;
  //   CheckBoxIcon = isCheckBox
  //       ? Icons.check_box_outline_blank_sharp
  //       : Icons.check_box_outlined;
  //   emit(ChangeCheckBox());
  // }

  bool isChecked = false;
  IconData checkBox = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility() {
    isChecked = !isChecked;
    checkBox = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState());
  }

  bool isChecked1 = false;
  IconData checkBox1 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility1() {
    isChecked1 = !isChecked1;
    checkBox1 = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState1());
  }

  bool isChecked2 = false;
  IconData checkBox2 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility2() {
    isChecked2 = !isChecked2;
    checkBox2 = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState2());
  }

  bool isChecked3 = false;
  IconData checkBox3 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility3() {
    isChecked3 = !isChecked3;
    checkBox3 = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState3());
  }

  bool isChecked4 = false;
  IconData checkBox4 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility4() {
    isChecked4 = !isChecked4;
    checkBox4 = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState4());
  }

  bool isChecked5 = false;
  IconData checkBox5 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility5() {
    isChecked5 = !isChecked5;
    checkBox5 = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState5());
  }

  bool isChecked6 = false;
  IconData checkBox6 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility6() {
    isChecked6 = !isChecked6;
    checkBox6 = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState6());
  }

  bool isChecked7 = false;
  IconData checkBox7 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility7() {
    isChecked7 = !isChecked7;
    checkBox7 = isChecked
        ? Icons.check_box_rounded
        : Icons.check_box_outline_blank_rounded;
    emit(AppChangeCheckBoxState7());
  }
}
//

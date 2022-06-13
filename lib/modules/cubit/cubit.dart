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

  // bool isChecked = false;
  // IconData checkBox = Icons.check_box_outline_blank_rounded;

  // void changePasswordVisibility() {
  //   isChecked = !isChecked;
  //   checkBox = isChecked
  //       ? Icons.check_box_rounded
  //       : Icons.check_box_outline_blank_rounded;
  //   emit(AppChangeCheckBoxState());
  // }
  IconData insialcheckBox = Icons.check_box_outline_blank_rounded;
  IconData SecondcheckBox = Icons.check_box_rounded;
  IconData checkBox = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility() {
    if (checkBox == insialcheckBox) {
      checkBox = SecondcheckBox;
    } else {
      checkBox = insialcheckBox;
    }
    emit(AppChangeCheckBoxState());
  }

  IconData checkBox1 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility1() {
    if (checkBox1 == insialcheckBox) {
      checkBox1 = SecondcheckBox;
    } else {
      checkBox1 = insialcheckBox;
    }
    emit(AppChangeCheckBoxState1());
  }

  IconData checkBox2 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility2() {
    if (checkBox2 == insialcheckBox) {
      checkBox2 = SecondcheckBox;
    } else {
      checkBox2 = insialcheckBox;
    }
    emit(AppChangeCheckBoxState2());
  }

  IconData checkBox3 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility3() {
    if (checkBox3 == insialcheckBox) {
      checkBox3 = SecondcheckBox;
    } else {
      checkBox3 = insialcheckBox;
    }
    emit(AppChangeCheckBoxState3());
  }

  IconData checkBox4 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility4() {
    if (checkBox4 == insialcheckBox) {
      checkBox4 = SecondcheckBox;
    } else {
      checkBox4 = insialcheckBox;
    }
    emit(AppChangeCheckBoxState4());
  }

  IconData checkBox5 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility5() {
    if (checkBox5 == insialcheckBox) {
      checkBox5 = SecondcheckBox;
    } else {
      checkBox5 = insialcheckBox;
    }
    emit(AppChangeCheckBoxState5());
  }

  IconData checkBox6 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility6() {
    if (checkBox6 == insialcheckBox) {
      checkBox6 = SecondcheckBox;
    } else {
      checkBox6 = insialcheckBox;
    }
    emit(AppChangeCheckBoxState6());
  }

  IconData checkBox7 = Icons.check_box_outline_blank_rounded;

  void changePasswordVisibility7() {
    if (checkBox7 == insialcheckBox) {
      checkBox7 = SecondcheckBox;
    } else {
      checkBox7 = insialcheckBox;
    }
    emit(AppChangeCheckBoxState7());
  }
}

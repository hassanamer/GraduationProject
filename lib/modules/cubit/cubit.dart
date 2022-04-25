import 'dart:ui';

import 'package:bloc/bloc.dart';
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
}

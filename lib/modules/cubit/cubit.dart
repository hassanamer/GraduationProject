import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/cubit/states.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class ChangeColorCubit extends Cubit<ChangesStates> {
  ChangeColorCubit() : super(InitialFavoriteIconColorState());

  bool iconColor = true;
  Color x = AppColors.disabledAndHintColor;

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

    print('$iconColor');
  }
}

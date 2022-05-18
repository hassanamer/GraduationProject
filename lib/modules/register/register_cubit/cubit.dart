import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/register/register_cubit/states.dart';

import '../../../../models/register_model.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;

  void userRegister({
    required String email,
    required String password,
    required String first_name,
    required String last_name,
    required String phone,
    required String date_of_birth,
    required String gender,
    required String country,
    required String username,
  }) {
    emit(AppRegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        "username": username,
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'password': password,
        'phone': phone,
        'gender': gender,
        'date_of_birth': date_of_birth,
        'country': country,
      },
    ).then((value) {
      print(value.data);

      registerModel = RegisterModel.fromJson(value.data);

      emit(AppRegisterSuccessState(registerModel));
    }).catchError((error) {
      print('error is = ${error.toString()}');
      emit(AppRegisterErrorState(error.toString()));
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppChangePasswordVisibilityState());
  }

  var formKey = GlobalKey<FormState>();

}

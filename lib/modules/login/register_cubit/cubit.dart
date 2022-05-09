import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/login/register_cubit/states.dart';

import '../../../../models/register_model.dart';
import '../../../../shared/network/end_points.dart';
import '../../../../shared/network/remote/dio_helper.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  Register_model? registerModel;

  void userRegister({
    required String email,
    required var password,
    required String firstname,
    required String lastName,
    required String phoneNumber,
    required String DateOfBirth,
    required String Gender,
    required String country,
    required String userName,
  }) {
    emit(AppRegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        "username": userName,
        'firstName': firstname,
        'lastName': lastName,
        'email': email,
        'password': password,
        'phone': phoneNumber,
        'gender': Gender,
        'date_of_birth': DateOfBirth,
        'country': country,
      },
    ).then((value) {
      print(value.data);

      registerModel = Register_model.fromJson(value.data);

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

  // void bottomSheet(context, widget) {
  //   showModalBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => widget,
  //   );
  // }

}

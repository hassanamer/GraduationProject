import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/models/login_model.dart';
import 'package:smarttouristguide/models/reset_password_model.dart';
import 'package:smarttouristguide/modules/login/login_screen.dart';
import 'package:smarttouristguide/modules/register/register_screen.dart';
import 'package:smarttouristguide/modules/login/login_cubit/states.dart';
import 'package:smarttouristguide/shared/components/constants.dart';
import 'package:smarttouristguide/shared/network/end_points.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);

  void getToken() {
    token = CacheHelper.getData(key: 'token') ?? '';
    emit(AppGetTokenDoneState());
  }

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AppLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      AppCubit().getProfile();
      AppCubit().getHomeData();
      AppCubit().getFavorites();
      emit(AppLoginSuccessState(loginModel));
    }).catchError((error) {
      print('error is = ${error.toString()}');
      emit(AppLoginErrorState(error.toString()));
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

  void bottomSheet(context, widget) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => widget,
    );
  }

  bool isLogin = true;
  Widget BmSheet = LoginScreen();

  void changeBottomSheet() {
    isLogin = !isLogin;
    BmSheet = isLogin ? LoginScreen() : RegisterScreen();
    print(isLogin);
    print(BmSheet.toString());
    emit(AppLoginChangeBottomSheetState());
  }

  ResetPasswordModel? resetPasswordModel;
  var resetPasswordKey = GlobalKey<FormState>();

  void resetPassword({
    required String email,
  }) {
    emit(AppResetPasswordLoadingState());

    DioHelper.postData(
      url: RESET_PASSWORD,
      data: {
        'email': email,
      },
    ).then((value) {
      print(value.data);
      resetPasswordModel = ResetPasswordModel.fromJson(value.data);
      emit(AppResetPasswordSuccessState(resetPasswordModel));
    }).catchError((error) {
      print('error is = ${error.toString()}');
      emit(AppResetPasswordErrorState(error.toString()));
    });
  }
}

import 'package:smarttouristguide/models/login_model.dart';
import 'package:smarttouristguide/models/reset_password_model.dart';


abstract class AppLoginStates {}

class AppLoginInitialState extends AppLoginStates {}

class AppLoginLoadingState extends AppLoginStates {}

class AppLoginSuccessState extends AppLoginStates
{
  final LoginModel? loginModel;

  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends AppLoginStates
{
  final String error;

  AppLoginErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AppLoginStates {}

class AppLoginChangeBottomSheetState extends AppLoginStates {}

class AppGetTokenDoneState extends AppLoginStates {}

class AppResetPasswordLoadingState extends AppLoginStates {}

class AppResetPasswordSuccessState extends AppLoginStates {

  final ResetPasswordModel? resetPasswordModel;

  AppResetPasswordSuccessState(this.resetPasswordModel);
}

class AppResetPasswordErrorState extends AppLoginStates {

  final String error;

  AppResetPasswordErrorState(this.error);
}
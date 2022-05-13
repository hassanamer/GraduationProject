import '../../../../models/register_model.dart';

abstract class AppRegisterStates {}

class AppRegisterInitialState extends AppRegisterStates {}

class AppRegisterLoadingState extends AppRegisterStates {}

class AppRegisterSuccessState extends AppRegisterStates
{
  final Register_model? RegisterModel;

  AppRegisterSuccessState(this.RegisterModel) {

  }
}

class AppRegisterErrorState extends AppRegisterStates
{
  final String error;

  AppRegisterErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AppRegisterStates {}



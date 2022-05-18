import '../../../../models/register_model.dart';

abstract class AppRegisterStates {}

class AppRegisterInitialState extends AppRegisterStates {}

class AppRegisterLoadingState extends AppRegisterStates {}

class AppRegisterSuccessState extends AppRegisterStates
{
  final RegisterModel? registerModel;

  AppRegisterSuccessState(this.registerModel) {

  }
}

class AppRegisterErrorState extends AppRegisterStates
{
  final String error;

  AppRegisterErrorState(this.error);
}

class AppChangePasswordVisibilityState extends AppRegisterStates {}



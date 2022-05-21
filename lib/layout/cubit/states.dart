import 'package:smarttouristguide/models/cat_interest_model.dart';

import '../../models/change_favorites_model.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavState extends AppStates {}

class AppLoadingDataState extends AppStates {}

class AppGetDataSuccessState extends AppStates {}

class AppGetDataErrorState extends AppStates {}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchSuccessState extends AppStates {}

class AppGetSearchErrorState extends AppStates {}

class AppLoadingGetPlaceDetails extends AppStates {}

class AppSuccessGetPlaceDetails extends AppStates {}

class AppErrorGetPlaceDetails extends AppStates {}

class AppChangeFavoritesState extends AppStates {}

class AppSuccessChangeFavoritesState extends AppStates
{
  final ChangeFavoritesModel model;

  AppSuccessChangeFavoritesState(this.model);
}



class AppErrorChangeFavoritesState extends AppStates {}

class AppLoadingGetFavoritesState extends AppStates {}

class AppSuccessGetFavoritesState extends AppStates {}

class AppErrorGetFavoritesState extends AppStates {}

class AppLoadingGetProfileState extends AppStates {}

class AppGetProfileSuccessState extends AppStates {}

class AppGetProfileErrorState extends AppStates {}

class AppEditProfileLoadingState extends AppStates {}

class AppEditProfileSuccessState extends AppStates {}

class AppEditProfileErrorState extends AppStates {}

class LoadState extends AppStates {}

class DoneState extends AppStates {}

class AppRateLoading extends AppStates {}

class AppRateSuccess extends AppStates {}

class AppRateError extends AppStates {}

class AppCommentLoading extends AppStates {}

class AppCommentSuccess extends AppStates {}

class AppCommentError extends AppStates {}

class LightState extends AppStates {}

class LightLoadingState extends AppStates {}

class AppChangePasswordVisibilityState extends AppStates {}

class AppChangeInterestsState extends AppStates {}

class AppSuccessChangeInterestsState extends AppStates
{
  final ChangeInterestModel model;

  AppSuccessChangeInterestsState(this.model);
}

class AppErrorChangeInterestsState extends AppStates {}

class AppLoadingGetInterestsState extends AppStates {}

class AppSuccessGetInterestsState extends AppStates {}

class AppErrorGetInterestsState extends AppStates {}

class AppUpdateProfileLoadingState extends AppStates {}

class AppUpdateProfileSuccessState extends AppStates {}

class AppUpdateProfileErrorState extends AppStates {}

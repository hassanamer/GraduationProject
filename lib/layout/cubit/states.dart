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

class AppGetPorfileSuccessState extends AppStates {}

class AppGetPorfileErrorState extends AppStates {}

class LoadState extends AppStates {}

class DoneState extends AppStates {}

class AppRateLoading extends AppStates {}

class AppRateSuccess extends AppStates {}

class AppRateError extends AppStates {}

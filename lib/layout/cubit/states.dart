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
  // final ChangeFavoritesModel model;

  // AppSuccessChangeFavoritesState(this.model);
}

class AppErrorChangeFavoritesState extends AppStates {}

class AppLoadingGetFavoritesState extends AppStates {}

class AppSuccessGetFavoritesState extends AppStates {}

class AppErrorGetFavoritesState extends AppStates {}

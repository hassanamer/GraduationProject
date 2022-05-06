abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeBottomNavState extends AppStates {}

class AppLoadingDataState extends AppStates {}

class AppGetDataSuccessState extends AppStates {}

class AppGetDataErrorState extends AppStates {}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchSuccessState extends AppStates {}

class AppGetSearchErrorState extends AppStates {}

class LoadingGetPlaceDetails extends AppStates {}

class SuccessGetPlaceDetails extends AppStates {}

class ErrorGetPlaceDetails extends AppStates {}

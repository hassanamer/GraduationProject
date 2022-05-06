import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/models/place_details_model.dart';
import 'package:smarttouristguide/modules/categories/categories_screen.dart';
import 'package:smarttouristguide/modules/favorites_screen/favorites_screen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/shared/network/end_points.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens =
  [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  HeoModel? heoModel;

  void getHomeEventOfferData() {
    emit(AppLoadingDataState());
    DioHelper.getData(
            url: 'home/events/',
            token: 'Token 53b704f45ca09497409820590b3fc8874eaec03e')
        .then((value) {
      heoModel = HeoModel.fromJson(value.data);
      print('model is \n${value.data}');
      emit(AppGetDataSuccessState());
    }).catchError((error) {
      print('${error.toString()}');
      emit(AppGetDataErrorState());
    });
  }

  CpModel? cpModel;

  void getCategoriesPlacesData() {
    emit(AppLoadingDataState());
    DioHelper.getData(
            url: 'home/places/',
            token: 'Token 53b704f45ca09497409820590b3fc8874eaec03e')
        .then((value) {
      cpModel = CpModel.fromJson(value.data);
      print('model is \n${value.data}');
      emit(AppGetDataSuccessState());
    }).catchError((error) {
      print('${error.toString()}');
      emit(AppGetDataErrorState());
    });
  }

  void test() {
    print('hello');
  }

  PlaceDetailsModel? placeDetailsModel;

  void getPlaceDetails({int? placeId}) {
    emit(LoadingGetPlaceDetails());
    DioHelper.postData(
        url: PLACE_DETAILS,
        token: 'Token 53b704f45ca09497409820590b3fc8874eaec03e',
        data: {'place_id': placeId}).then((value) {
      placeDetailsModel = PlaceDetailsModel.fromJson(value.data);
      print(value.data);
      emit(SuccessGetPlaceDetails());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetPlaceDetails());
    });
  }

  Map<int?, bool?> favorites = {};

  // void getHomeData() {
  //   emit(ShopLoadingHomeDataState());
  //   DioHelper.getData(
  //     url: HOME, token: token,
  //   ).then((value)
  //   {
  //     homeModel = HomeModel.fromJson(value.data);
  //     homeModel!.data!.products.forEach((element)
  //     {
  //       favorites.addAll({
  //         element.id: element.inFavorites
  //       });
  //     });
  //     emit(ShopSuccessHomeDataState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ShopErrorHomeDataState());
  //   });
  // }
}

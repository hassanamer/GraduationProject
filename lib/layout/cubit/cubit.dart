import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/models/favorites_data_model.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/models/place_details_model.dart';
import 'package:smarttouristguide/modules/categories/categories_screen.dart';
import 'package:smarttouristguide/modules/favorites_screen/favorites_screen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/shared/network/end_points.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';

import '../../shared/components/constants.dart';

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

  // ChangeFavoritesModel? changeFavoritesModel;
  //
  // void changeFavorite(int? productId)
  // {
  //   favorites[productId] = !favorites[productId]!;
  //   emit(AppChangeFavoritesState());
  //
  //   DioHelper.postData(
  //     url: 'home/favouriteplace/',
  //     data: {
  //       'product_id' : productId,
  //     },
  //     token: token,
  //   ).then((value)
  //   {
  //     changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
  //     print(value.data);
  //
  //     if(!changeFavoritesModel!.status)
  //     {
  //       favorites[productId] = !favorites[productId]!;
  //     } else
  //     {
  //       getFavorites();
  //     }
  //
  //     emit(AppSuccessChangeFavoritesState());
  //   }).catchError((error)
  //   {
  //     favorites[productId] = !favorites[productId]!;
  //     emit(AppErrorChangeFavoritesState());
  //   }) ;
  // }

  GetFavoritesModel? getFavoritesModel;

  void getFavorites()
  {
    emit(AppLoadingGetFavoritesState());

    DioHelper.getData(
      url: 'home/favouriteplace/',
      token: 'Token 53b704f45ca09497409820590b3fc8874eaec03e',
    ).then((value) {
      getFavoritesModel = GetFavoritesModel.fromJson(value.data);
      print(value.data);
      emit(AppSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorGetFavoritesState());
    });
  }

  HomeModel? homeModel;
  Map<int?, bool?> favorites = {};

  void getHomeEventOfferData() {
    emit(AppLoadingDataState());
    DioHelper.getData(
            url: 'home/events/',
            token: 'Token 53b704f45ca09497409820590b3fc8874eaec03e')
        .then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.places.forEach((element)
      {
        favorites.addAll({
          element.id: element.inFavourite
        });
      });
      emit(AppGetDataSuccessState());
    }).catchError((error) {
      emit(AppGetDataErrorState());
    });
  }

  CpModel? cpModel;

  void getCategoriesPlacesData() {
    emit(AppLoadingDataState());
    DioHelper.getData(
            url: 'home/places/',
            token: token)
        .then((value) {
      cpModel = CpModel.fromJson(value.data);
      emit(AppGetDataSuccessState());
    }).catchError((error) {
      emit(AppGetDataErrorState());
    });
  }

  PlaceDetailsModel? placeDetailsModel;

  void getPlaceDetails({int? placeId}) {
    emit(AppLoadingGetPlaceDetails());
    DioHelper.postData(
        url: PLACE_DETAILS,
        token: token,
        data: {'place_id': placeId}).then((value) {
      placeDetailsModel = PlaceDetailsModel.fromJson(value.data);
      emit(AppSuccessGetPlaceDetails());
    }).catchError((error) {
      emit(AppErrorGetPlaceDetails());
    });
  }
//
}

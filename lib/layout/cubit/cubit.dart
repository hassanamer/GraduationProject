import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/models/favorites_data_model.dart';
import 'package:smarttouristguide/models/get_profile_model.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/models/place_details_model.dart';
import 'package:smarttouristguide/models/rate_model.dart';
import 'package:smarttouristguide/modules/categories/categories_screen.dart';
import 'package:smarttouristguide/modules/favorites_screen/favorites_screen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/shared/components/constants.dart';
import 'package:smarttouristguide/shared/network/end_points.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../models/change_favorites_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorite(dynamic placeId) {
    favorites[placeId] = !favorites[placeId]!;
    emit(AppChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'place_id': placeId,
      },
      token: 'Token ${token}',
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if (!changeFavoritesModel!.status) {
        favorites[placeId] = !favorites[placeId]!;
      } else {
        getFavorites();
      }
      emit(AppSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      print(error.toString());
      favorites[placeId] = !favorites[placeId]!;
      emit(AppErrorChangeFavoritesState());
    });
  }

  GetFavoritesModel? getFavoritesModel;

  void getFavorites() {
    emit(AppLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: 'Token ${token}',
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
  Map<dynamic, bool?> favorites = {};

  Future getHomeEventOfferData() async{
    emit(AppLoadingDataState());
    DioHelper.getData(
      url: 'home/events/',
      token: 'Token ${token}',
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.places.forEach((element) {
        favorites.addAll({element.id: element.inFavourite});
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
      token: 'Token ${token}',
    ).then((value) {
      cpModel = CpModel.fromJson(value.data);
      emit(AppGetDataSuccessState());
    }).catchError((error) {
      emit(AppGetDataErrorState());
    });
  }

  PlaceDetailsModel? placeDetailsModel;

  Future getPlaceDetails({int? placeId}) async {
    emit(AppLoadingGetPlaceDetails());
    DioHelper.postData(
        url: PLACE_DETAILS,
        token: 'Token ${token}',
        data: {'place_id': placeId}).then((value) {
      placeDetailsModel = PlaceDetailsModel.fromJson(value.data);
      print(value.data);
      emit(AppSuccessGetPlaceDetails());
    }).catchError((error) {
      print('place details error is\n ${error.toString()}');
      emit(AppErrorGetPlaceDetails());
    });
  }

  GetProfileModel? getProfileModel;

  void getProfile() {
    emit(AppLoadingGetProfileState());
    DioHelper.getData(
      url: 'api/profile/',
      token: 'Token ${token}',
    ).then((value) {
      getProfileModel = GetProfileModel.fromJson(value.data);
      emit(AppGetPorfileSuccessState());
    }).catchError((error) {
      emit(AppGetPorfileErrorState());
    });
  }

  showReviewBottomSheet({
    required context,
    required String placeName,
    required placeId,
    required rate,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) => (Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your experience helps us to analyze data and recommend the best places for you. ♥',
              ),
              Text(
                'Rate ${placeName}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              Center(
                child: Container(
                  child: Row(
                    children: [
                      RatingBar.builder(
                        itemBuilder: (context, _) => Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.primaryColor,
                        ),
                        glow: false,
                        unratedColor: AppColors.disabledAndHintColor,
                        onRatingUpdate: (rating) {
                          print(rating.toInt());
                          addUpdateRate(
                            placeId: placeId,
                            rate: rating,
                          );
                        },
                        itemCount: 5,
                        minRating: 1.0,
                        maxRating: 5.0,
                        itemSize: 45.0,
                        direction: Axis.horizontal,
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0x5F005764),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  width: 250,
                ),
              ),
              SizedBox(
                child: Text(
                  'Add Comment on ${placeName}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          )),
        ),
      )),
    );
  }

  RateModel? rateModel;

  Future addUpdateRate({
    int? placeId,
    dynamic rate,
  }) async {
    emit(AppRateLoading());
    DioHelper.postData(url: ADD_UPDATE_RATE, token: 'Token ${token}', data: {
      'place_id': placeId,
      'rate': rate,
    }).then((value) {
      rateModel = RateModel.fromJson(value.data);
      print(value.data);
      emit(AppRateSuccess());
    }).catchError((error) {
      print('error when adding updating rate \n ${error.toString()}');
      emit(AppRateError());
    });
  }

  void test() {
    print('test hi from home');
  }

}

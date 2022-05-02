import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/modules/categories/categories_screen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/modules/wish_list/wish_list.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens =
  [
    HomeScreen(),
    CategoriesScreen(),
    WishListScreen(),
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
      token: 'Token 53b704f45ca09497409820590b3fc8874eaec03e'
    ).then((value) {
      heoModel = HeoModel.fromJson(value.data);
      print('model is \n${value.data}');
      emit(AppGetDataSuccessState());
    }).catchError((error){
      print('${error.toString()}');
      emit(AppGetDataErrorState());
    });
  }

  CpModel? cpModel;

  void getCategoriesPlacesData() {
    emit(AppLoadingDataState());
    DioHelper.getData(
      url: 'home/places/',
      token: 'Token 53b704f45ca09497409820590b3fc8874eaec03e'
    ).then((value) {
      cpModel = CpModel.fromJson(value.data);
      print('model is \n${value.data}');
      emit(AppGetDataSuccessState());
    }).catchError((error){
      print('${error.toString()}');
      emit(AppGetDataErrorState());
    });
  }

  void test() {
    print('hello');
  }
}
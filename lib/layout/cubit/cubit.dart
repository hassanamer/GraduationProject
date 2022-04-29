import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
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

  StgModel? stgModel;

  void getData() {
    emit(HomeLoadingHomeDataState());
    DioHelper.getData(
      url: 'https://gist.githubusercontent.com/amrali500/f6f888bb859d96eb185aceea849cf127/raw/a6d7b1100781bf3d7d08ebb24074ea31c3d6cd20/STGapi.json',
    ).then((value) {
      stgModel = StgModel.fromJson(value.data);
      emit(HomeGetDataSuccessState());
    }).catchError((error){
      emit(HomeGetDataErrorState());
    });
  }
}
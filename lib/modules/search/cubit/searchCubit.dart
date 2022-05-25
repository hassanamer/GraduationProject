import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/models/city_search_model.dart';
import 'package:smarttouristguide/modules/search/cubit/searchStates.dart';
import 'package:smarttouristguide/shared/components/constants.dart';
import 'package:smarttouristguide/shared/network/end_points.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<ShopStates> {
  SearchCubit() : super(InitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  CitySearchModel? citySearchModel;
  void getSearchData(String searchText){
    emit(SearchLoadingState());
    DioHelper.postData(
        url: SEARCH,
        token: 'Token ${token}',
        data: {
          'city':'$searchText',
        }
    ).then((value){
      citySearchModel = CitySearchModel.fromJson(value.data);
      print('Search '+citySearchModel!.status.toString());
      emit(SearchSuccessState());
    }).catchError((error){
      emit(SearchErrorState());
      print(error.toString());
    });
  }
}
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/models/search_model.dart';
import 'package:smarttouristguide/modules/search_test/states.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';

import '../../shared/components/constants.dart';

class SearchCubit extends Cubit<ShopStates> {
  SearchCubit() : super(InitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  void getSearchData(String searchText){
    emit(SearchLoadingState());
    DioHelper.postData(
        url: 'home/search/',
        token: token,
        data: {
          'place':'$searchText',
        }
    ).then((value){
      searchModel = SearchModel.fromJson(value.data);
      print('Search '+searchModel!.status.toString());
      emit(SearchSuccessState());
    }).catchError((error){
      emit(SearchErrorState());
      print(error.toString());
    });
  }
}
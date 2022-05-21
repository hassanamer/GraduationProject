import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sentiment_dart/sentiment_dart.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/models/comment_model.dart';
import 'package:smarttouristguide/models/favorites_data_model.dart';
import 'package:smarttouristguide/models/get_profile_model.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/models/place_details_model.dart';
import 'package:smarttouristguide/models/rate_model.dart';
import 'package:smarttouristguide/modules/categories/categories_screen.dart';
import 'package:smarttouristguide/modules/favorites_screen/favorites_screen.dart';
import 'package:smarttouristguide/modules/home/home_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/components/constants.dart';
import 'package:smarttouristguide/shared/network/end_points.dart';
import 'package:smarttouristguide/shared/network/remote/dio_helper.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import '../../models/cat_interest_model.dart';
import '../../models/change_favorites_model.dart';
import '../../models/get_interests_model.dart';

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
      emit(AppSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorGetFavoritesState());
    });
  }

  HomeModel? homeModel;
  Map<dynamic, bool?> favorites = {};
  Map<dynamic, bool?> interests = {};
  List<String> favCats = [];
  List<HomePlaces> CatRecommended= [];

  Future getHomeData() async {
    emit(AppLoadingDataState());
    DioHelper.getData(
      url: 'home/events/',
      token: 'Token ${token}',
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data.home_places.forEach((element) {
        favorites.addAll({element.id: element.inFavourite});
      });
      ageRecommend();
      recommendation();
      blacklist();
      catRecommend();

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
      cpModel!.data.category.forEach((element) {
        interests.addAll({element.id: element.inFavourite});
      });

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
      url: PROFILE,
      token: 'Token ${token}',
    ).then((value) {
      getProfileModel = GetProfileModel.fromJson(value.data);
      emit(AppGetProfileSuccessState());
    }).catchError((error) {
      emit(AppGetProfileErrorState());
    });
  }


  // void editProfile() {
  //   emit(AppEditProfileLoadingState());
  //   DioHelper.postData(
  //     url: REGISTER,
  //     data: {
  //       "username": username,
  //       'first_name': first_name,
  //       'last_name': last_name,
  //       'email': email,
  //       'password': password,
  //       'phone': phone,
  //       'gender': gender,
  //       'date_of_birth': date_of_birth,
  //       'country': country,
  //     },
  //   ).then((value) {};
  // }

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

  CommentModel? commentModel;

  Future addComment({
    int? placeId,
    dynamic comment,
  }) async {
    emit(AppCommentLoading());
    DioHelper.postData(
      url: ADD_COMMENT,
      token: 'Token ${token}',
      data: {
        'place_id': placeId,
        'comment': comment,
      },
    ).then((value) {
      commentModel = CommentModel.fromJson(value.data);
      showToast(message: commentModel!.message);
      emit(AppCommentSuccess());
    }).catchError((error) {
      print('error when adding updating rate \n ${error.toString()}');
      emit(AppCommentError());
    });
  }

  var commentmKey = GlobalKey<FormState>();
  var commentController = TextEditingController();

  showReviewBottomSheet({
    required context,
    required String placeName,
    required placeId,
    required rate,
  }) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (context) => Wrap(
        children: [
          (Padding(
            padding: const EdgeInsets.all(8.0),
            child: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rate ${placeName}',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 5.0,
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
                          itemSize: 35.0,
                          direction: Axis.horizontal,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.disabledAndHintColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    width: 250,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  child: Text(
                    'Add Comment on ${placeName}',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.disabledAndHintColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Form(
                      key: commentmKey,
                      child: TextField(
                        controller: commentController,
                        minLines: 2,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Type your comment here..',
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                          ),
                          contentPadding: EdgeInsets.all(11),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          addComment(
                            placeId: placeId,
                            comment: commentController.text,
                          ).then((value) {
                            commentController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 275,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: AppColors.primaryColor,
                        textColor: Colors.white,
                        child: Text(
                          'Submit',
                        ),
                        onPressed: () {
                          if (commentmKey.currentState!.validate()) {
                            addComment(
                              placeId: placeId,
                              comment: commentController.text,
                            ).then((value) {
                              commentController.clear();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  child: Text(
                    'Sharing your experience helps us analyze data and recommend better places.',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            )),
          )),
        ],
      ),
    );
  }

  List<HomePlaces> recommended = [];
  List<String> placeComments1 = [];

  void recommendation() {
    {
      recommended = [];
      int placeIndex = 0;

      for (var place in homeModel!.data.home_places) {
        for (var commentMap
            in homeModel!.data.home_places[placeIndex].comments) {
          placeComments1.add(commentMap.comment);
        }
        if (placeComments1.length > 0) {
          print('${placeComments1}');
          String sentimentText = placeComments1.join(' ');
          if (Sentiment.analysis(sentimentText).words.good.length >
                  Sentiment.analysis(sentimentText).words.bad.length &&
              place.rate > 3.7) {
            recommended.add(place);
          } else {
            print('not recommended');
          }
        }
        placeComments1 = [];
        placeIndex++;
      }
      for (var i in recommended) {
        print(i.placeName);
      }
    }
  }

  List<HomePlaces> notRecommended = [];
  List<String> placeComments2 = [];

  void blacklist() {
    {
      notRecommended = [];
      int placeIndex = 0;

      for (var place in homeModel!.data.home_places) {
        for (var commentMap
            in homeModel!.data.home_places[placeIndex].comments) {
          placeComments2.add(commentMap.comment);
        }
        if (placeComments2.length > 0) {
          print('${placeComments2}');
          String sentimentText = placeComments2.join(' ');
          if (Sentiment.analysis(sentimentText).words.bad.length >
                  Sentiment.analysis(sentimentText).words.good.length &&
              place.rate <= 2.5) {
            notRecommended.add(place);
          } else {
            print('not recommended');
          }
        }
        placeComments2 = [];
        placeIndex++;
      }
      for (var i in notRecommended) {
        print(i.placeName);
      }
    }
  }

  List<HomePlaces> ageRecommended = [];
  var age;

  void ageRecommend() {
    ageRecommended = [];
    var user = getProfileModel!.data;
    String date_of_birth = user.dateOfBirth;
    var places = homeModel!.data.home_places;

    int day = int.parse('${date_of_birth[0]}${date_of_birth[1]}');
    int month = int.parse('${date_of_birth[3]}${date_of_birth[4]}');
    int year = int.parse('${date_of_birth[6]}${date_of_birth[7]}${date_of_birth[8]}${date_of_birth[9]}');
    DateTime birthday = DateTime(year, month, day);
    age = AgeCalculator.age(birthday).years;

    if (age < 35) {
      for (var place in places) {
        if (place.ageCategory == 'Youths') {
          ageRecommended.add(place);
        }
      }
    } else if (age >= 35) {
      for (var place in places) {
        if (place.ageCategory == 'Adults') {
          ageRecommended.add(place);
        }
      }
    }
  }

  void cubitTest() {
    print("it's ok");
  }

  ChangeInterestModel? changeInterestModel;

  void changeInterest(dynamic categoryId) {
    interests[categoryId] = !interests[categoryId]!;
    emit(AppChangeInterestsState());

    DioHelper.postData(
      url: INTERESTS,
      data: {
        'category_id': categoryId,
      },
      token: 'Token ${token}',
    ).then((value) {
      changeInterestModel = ChangeInterestModel.fromJson(value.data);
      print(value.data);

      if (!changeInterestModel!.status) {
        interests[categoryId] = !interests[categoryId]!;
      } else {
        getInterests();
      }
      emit(AppSuccessChangeInterestsState(changeInterestModel!));
    }).catchError((error) {
      print(error.toString());
      interests[categoryId] = !interests[categoryId]!;
      emit(AppErrorChangeInterestsState());
    });
  }

  GetInterestsModel? getInterestsModel;

  void getInterests() {
    emit(AppLoadingGetInterestsState());

    DioHelper.getData(
      url: INTERESTS,
      token: 'Token ${token}',
    ).then((value) {
      getInterestsModel = GetInterestsModel.fromJson(value.data);
      emit(AppSuccessGetInterestsState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorGetInterestsState());
    });
  }

  void catRecommend() {
    favCats = [];
    CatRecommended = [];
    getCategoriesPlacesData();

    for(var cat in cpModel!.data.category) {
      if(cat.inFavourite) {
        favCats.add(cat.name);
      }
    }
    for(var place in homeModel!.data.home_places) {
      if(favCats.contains(place.type)) {
        CatRecommended.add(place);
      }
    }
    for(var place in CatRecommended) {
      print('place name: ${place.placeName}\nplace category: ${place.type}');
    }
  }
}

// int placeIndex = 0;
// for (var place in homeModel!.data.places[0].) {
//   int commentIndex= 0;
//   for (var comment in place.comments) {
//     placeComments.add(comment.comment);
//     print(placeComments);
//   }

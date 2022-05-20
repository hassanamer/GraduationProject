import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/place_details_model.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class PlaceDetailsScreen extends StatelessWidget {
  String? catName;

  PlaceDetailsScreen({
    String? catName1,
  }) {
    catName = catName1;
  }

  static const String routeName = 'PlaceDetailsScreen';

  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessChangeFavoritesState) {
          if (!state.model.status) {
            showToast(
              message: '${state.model.message}',
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! AppLoadingGetPlaceDetails,
          builder: (context) => RefreshIndicator(
            onRefresh: () {
              return cubit.getPlaceDetails(
                  placeId: cubit.placeDetailsModel!.data.id);
            },
            child: PlaceDetailsScreenBuilder(
                cubit.placeDetailsModel!.data, context, catName),
            color: AppColors.primaryColor,
            backgroundColor: AppColors.backgroundColor,
          ),
          fallback: (context) => Container(
            color: AppColors.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    LinearProgressIndicator(
                      color: AppColors.primaryColor,
                      backgroundColor: Color(0xffffebc9),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget PlaceDetailsScreenBuilder(Data model, context, catName) => Scaffold(
  appBar: AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white),
    toolbarHeight: 0,
  ),
  body: SingleChildScrollView(
    child: Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        ' ${model.placeName}',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                    Text(
                      '${model.city}',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Spacer(),
                    catName != null
                        ? Text(
                      '${catName}',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    )
                        : Text(''),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('${model.image}'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Row(
                    children: [
                      RatingBarIndicator(
                        rating: model.rate.toDouble(),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                        ),
                        itemCount: 5,
                        itemSize: 20.5,
                        direction: Axis.horizontal,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/location.svg',
                              height: 12,
                              width: 12,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'GPS Location',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        AppCubit.get(context).changeFavorite(model.id);
                      },
                      child: Icon(
                        Icons.favorite_outlined,
                        color: AppCubit.get(context).favorites[model.id]!
                            ? AppColors.primaryColor
                            : AppColors.disabledAndHintColor,
                        size: 26.0,
                      ),
                    ),
                    Text(
                      AppCubit.get(context).favorites[model.id]!
                          ? '  It\'s in your favorites list!'
                          : '  Add this to your favorites list',
                      style: TextStyle(
                        fontSize: 15.5,
                        color: Color(0xCA000000),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About ${model.placeName}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ReadMoreText('${model.Description}',
                    style: TextStyle(
                      color: AppColors.bodyDetailsColor,
                    ),
                    trimLines: 3,
                    colorClickableText: AppColors.primaryColor,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Less '),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                model.comments.length == 0
                    ? Text(
                  'There\'s no comments for this place',
                )
                    : Text(''),
                ListView.separated(
                  itemBuilder: (context, index) =>
                      commentBuilder(model.comments[index]),
                  separatorBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      divider(),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                  itemCount: model.comments.length,
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
  floatingActionButton: DraggableFab(
    child: FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      child: Icon(Icons.reviews_rounded),
      onPressed: () => AppCubit.get(context).showReviewBottomSheet(
        context: context,
        placeName: model.placeName,
        placeId: model.id,
        rate: model.rate,
      ),
    ),
  ),
);

Widget commentBuilder(Comments commentModel) => Container(
  color: Colors.white,
  width: double.infinity,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '@${commentModel.user}',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      SizedBox(
        height: 2.0,
      ),
      Text(
        '${commentModel.comment}',
      ),
    ],
  ),
);
//

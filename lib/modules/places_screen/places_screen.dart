import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import '../../models/cat_places_model.dart';

class PlacesScreen extends StatelessWidget {
  late final int catIndex;
  late final String catName;

  PlacesScreen({
    required int? catIndex1,
    required String? catName1,
  }) {
    catIndex = catIndex1!;
    catName = catName1!;
  }

  @override
  Widget build(BuildContext context) {
    var catIndex = this.catIndex;
    var catName = this.catName;
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColors.primaryColor,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: AppColors.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  18,
                ),
                bottomRight: Radius.circular(
                  18,
                ),
              ),
            ),
            centerTitle: true,
            title: Text(
              '${catName} Places',
              style: TextStyle(
                fontSize: 17.5,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: cubit.cpModel != null,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(height: 5.0),
                  buildPlacesItem(
                      context,
                      cubit.cpModel!.data.category[catIndex].info.places[index],
                      catName),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 5.0,
              ),
              itemCount:
                  cubit.cpModel!.data.category[catIndex].info.places.length,
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildPlacesItem(context, Places model, catName) => Container(
      height: 250.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170.0,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage('${model.image}'),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              ' ${model.placeName}',
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  RatingBarIndicator(
                    rating: model.rate.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: AppColors.secondColor,
                    ),
                    itemCount: 5,
                    itemSize: 20,
                    direction: Axis.horizontal,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      AppCubit.get(context).getPlaceDetails(
                        placeId: model.id,
                      );
                      navigateTo(
                        context: context,
                        widget: PlaceDetailsScreen(
                          catName1: catName,
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/active_navigate.svg',
                          height: 19,
                          width: 19,
                        ),
                        Text(
                          ' Details',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

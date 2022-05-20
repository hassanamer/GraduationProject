import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/favorites_data_model.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class InterestsScreen extends StatelessWidget {

  static const routeName = 'Interest';
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => buildFavItem(
                cubit.getFavoritesModel!.data.places[index], context),
            separatorBuilder: (context, index) => SizedBox(
              height: 8.0,
            ),
            itemCount: cubit.getFavoritesModel!.data.places.length,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildFavItem(Places model, context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    height: 80,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          AppCubit.get(context).getPlaceDetails(
            placeId: model.id,
          );
          navigateTo(
            context: context,
            widget: PlaceDetailsScreen(),
          );
        },
        child: Row(
          children: [
            Container(
              width: 110,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: NetworkImage('${model.image}'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.placeName}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 130,
                  child: Text(
                    '${model.Description}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 11.8,
                        fontWeight: FontWeight.bold,
                        color: AppColors.disabledAndHintColor),
                  ),
                ),
                Spacer(),
                RatingBarIndicator(
                  itemBuilder: (context, state) => Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.primaryColor,
                  ),
                  itemCount: 5,
                  rating: model.rate.toDouble(),
                  unratedColor: AppColors.disabledAndHintColor,
                  direction: Axis.horizontal,
                  itemSize: 18,
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 22.0,
                color: AppCubit.get(context).favorites[model.id]!
                    ? AppColors.primaryColor
                    : AppColors.disabledAndHintColor,
              ),
              onPressed: () {
                AppCubit.get(context).changeFavorite(model.id);
              },
            ),
          ],
        ),
      ),
    ),
  );
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/favorites_data_model.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => buildFavItem(cubit.getFavoritesModel!.data.places[index], context),
            separatorBuilder: (context, index) => divider(),
            itemCount: cubit.getFavoritesModel!.data.places.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }

  Widget buildFavItem(Places model, context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children: [
          Container(
            width: 150,
            child: Image(
              image: NetworkImage('${model.image}'),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.placeName}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.rate}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 5.0,),
                    if(model.inFavourite)
                      Text(
                        '${model.rate}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 14.0,
                        color: AppCubit.get(context).favorites[model.id]! ? AppColors.primaryColor : AppColors.disabledAndHintColor,
                      ),
                      onPressed: ()
                      {
                        AppCubit.get(context).changeFavorite(model.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

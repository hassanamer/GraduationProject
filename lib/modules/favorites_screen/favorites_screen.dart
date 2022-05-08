import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/models/favorites_data_model.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../layout/cubit/states.dart';

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
          condition: cubit.getFavoritesModel != null,

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
          Image(
            image: NetworkImage('${model.image}'),
            height: 120.0,
            width: 120.0,
          ),
          const SizedBox(
            height: 20.0,
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
                      '${model.placeName}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: Colors.green,
                        child: const Icon(
                          Icons.favorite_border,
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: ()
                      {
                        // AppCubit.get(context).changeFavorite(model.product!.id);
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
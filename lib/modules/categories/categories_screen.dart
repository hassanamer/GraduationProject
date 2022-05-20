import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/modules/places_screen/places_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.cpModel != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => buildCategoryItem(
                context, cubit.cpModel!.data.category[index], index),
            separatorBuilder: (context, index) => SizedBox(
              height: 5.0,
            ),
            itemCount: cubit.cpModel!.data.category.length,
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }
}

Widget buildCategoryItem(context, Category model, index) => Container(
  height: 205.0,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(
      20.0,
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.only(
      bottom: 10.0,
      left: 10,
      right: 10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 7.0,
        ),
        Text(
          ' ${model.name}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Center(
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 160,
                    width: double.infinity,
                    image: NetworkImage(
                      '${model.catImage}',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 13.0,
              ),
              child: InkWell(
                onTap: () {
                  navigateTo(
                    widget: PlacesScreen(
                      catIndex1: index,
                      catName1: model.name,
                    ),
                    context: context,
                  );
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      0.78,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: Text(
                    'Discover Places',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        height: 1.72
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);

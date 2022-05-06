import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/modules/places_screen/places_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                context, cubit.cpModel!.data!.category![index], index),
            separatorBuilder: (context, index) => SizedBox(
              height: 5.0,
            ),
            itemCount: cubit.cpModel!.data!.category!.length,
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

List<String> imgs = [
  'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_headers/281608/900x600-1-50-c5a716e2a72b1087ab9bc2e11e52a16e.jpg',
  'https://www.egypttoday.com/siteimages/Larg/59380.jpg',
  'https://live.staticflickr.com/1822/28327211697_59fac6f2f9_b.jpg',
  'https://www.globetrove.com/wp-content/uploads/2018/06/IMG_20180601_134802.jpg',
  'https://identity-mag.com/wp-content/uploads/2018/11/Singe.jpg',
  'https://www.touropia.com/gfx/d/best-beaches-in-egypt/mahmya_island.jpg',
  'https://shehabnews.com/uploads//images/70c8bdae322743745d112a69bb9d0aaf.jpg',
];

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
                      borderRadius: BorderRadius.circular(15.0,),
                      child: Image(
                        fit: BoxFit.cover,
                        height: 160,
                        width: double.infinity,
                        image: NetworkImage(
                          '${imgs[index]}',
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
                        AppLocalizations.of(context)!.discover_places,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
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

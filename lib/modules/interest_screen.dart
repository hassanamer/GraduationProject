import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class InterestsScreen extends StatelessWidget {
  static const routeName = 'Interest';

  @override
  Widget build(BuildContext context) {
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
              'Places',
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' What categories of tourism\n are you interested in?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.bodyDetailsColor),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  ListView.separated(
                    itemBuilder: (context, index) => buildInterestCategoryItem(
                        context, cubit.cpModel!.data.category[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 8.0,
                    ),
                    itemCount: cubit.cpModel!.data.category.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildInterestCategoryItem(context, Category category) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  Text(
                    '# ${category.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 22.0,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      AppCubit.get(context).changeFavorite(8);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

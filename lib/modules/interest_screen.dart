import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../layout/app_layout.dart';
import '../shared/components/components.dart';

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
            leading: Text(''),
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
              'Select your interests',
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
                  Row(
                    children: [
                      Text(
                        ' What categories of tourism\n are you interested in?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 17.5,
                            fontWeight: FontWeight.bold,
                            color: AppColors.bodyDetailsColor),
                      ),
                      Spacer(),
                      MaterialButton(
                        child: Text(
                          'Get Started',
                        ),
                        textColor: Colors.white,
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        onPressed: () {
                          cubit.getCategoriesPlacesData();
                          cubit.getInterests();
                          cubit.getHomeData();
                          navigateTo(
                            context: context,
                            widget: AppLayout(),
                          );
                        },
                      ),
                    ],
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
                      AppCubit.get(context).interests[category.id]!
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_outlined,
                      size: 22.0,
                      color: AppCubit.get(context).interests[category.id]!
                          ? AppColors.primaryColor
                          : AppColors.disabledAndHintColor,
                    ),
                    onPressed: () {
                      AppCubit.get(context).changeInterest(category.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

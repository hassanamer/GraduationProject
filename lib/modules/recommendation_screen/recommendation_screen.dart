import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class RecommendationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            title: const Text(
              'Recommended',
            ),
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => buildRecommendationItem(context),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: 10,
          ),
        );
      },
    );
  }
}

Widget buildRecommendationItem(context) => Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Place Name',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              'Place Description',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[600],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/pcimg.jpg'),
              ),
            ),
            Row(
              children: [
                RatingBarIndicator(
                  rating: 4.0,
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
                  onTap: () {
                    navigateTo(
                      widget: PlaceDetailsScreen(),
                      context: context,
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/active_navigate.svg',
                      ),
                      Text(
                        ' See Details',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

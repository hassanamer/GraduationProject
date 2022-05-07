import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/place_details_model.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class PlaceDetailsScreen extends StatelessWidget {
  String? catName;

  PlaceDetailsScreen({
    String? catName1,
  }) {
    catName = catName1;
  }

  var mediaController = PageController();

  static const String routeName = 'PlaceDetailsScreen';

  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! LoadingGetPlaceDetails,
          builder: (context) => PlaceDetailsScreenBuilder(
              cubit.placeDetailsModel!.data!, context, catName),
          fallback: (context) => Container(
            color: AppColors.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
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

Widget PlaceDetailsScreenBuilder(Data model, context, catName) => Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.backgroundColor),
        toolbarHeight: 0,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        title: Text(
          'Back To Places',
          style: TextStyle(color: AppColors.primaryColor, fontSize: 15.0),
        ),
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
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                              ),
                            ),
                            Text(
                              '${model.placeName}',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outlined,
                            color: AppColors.disabledAndHintColor,
                            size: 29.0,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                        Text(
                          'Giza, 6 of October',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${catName}',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 180,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7
                      ),
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
                    Text(
                      '${model.Description}',
                      style: TextStyle(
                        color: AppColors.bodyDetailsColor,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Container(
                        width: 285.0,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(
                              20,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Visit Webiste',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/website.svg',
                              ),
                            ],
                          ),
                        ),
                      ),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget RateIcon(bool color, double size) => Icon(
      Icons.star_rate_rounded,
      color: color ? AppColors.primaryColor : AppColors.disabledAndHintColor,
      size: size,
    );

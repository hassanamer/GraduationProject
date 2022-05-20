import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/modules/search/search_screen.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/components/components.dart';
import '../events/events_screen.dart';
import '../offers/offer_screen.dart';
import '../recommendation_screen/recommendation_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSuccessChangeFavoritesState) {
          if (!state.model.status) {
            showToast(
              message: '${state.model.message}',
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => RefreshIndicator(
            onRefresh: () {
              return cubit.getHomeData();
            },
            child: state is AppLoadingDataState
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Updating Data',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          LinearProgressIndicator(
                            color: AppColors.primaryColor,
                            backgroundColor: AppColors.secondColor,
                          ),
                        ],
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height *
                                      0.054,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      11.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      navigateTo(
                                        widget: SearchScreen(),
                                        context: context,
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 21.0,
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/search.svg',
                                        ),
                                        SizedBox(
                                          width: 17.0,
                                        ),
                                        Text(
                                          'Where to go?',
                                          style: TextStyle(
                                            color:
                                                AppColors.disabledAndHintColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    navigateTo(
                                      widget: EventsScreen(),
                                      context: context,
                                    );
                                  },
                                  child: HomeRow(
                                    text: AppLocalizations.of(context)!.events,
                                    iconPath: 'assets/icons/events.svg',
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    navigateTo(
                                      widget: OffersScreen(),
                                      context: context,
                                    );
                                  },
                                  child: HomeRow(
                                    text: AppLocalizations.of(context)!.offers,
                                    iconPath: 'assets/icons/offers.svg',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                cubit.CatRecommended.isNotEmpty ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Suggested for your interests',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.5,
                                          ),
                                        ),
                                        // Spacer(),
                                        // InkWell(
                                        //   child: Row(
                                        //     children: [
                                        //       Icon(
                                        //         Icons.more_horiz_rounded,
                                        //         color: AppColors.primaryColor,
                                        //       ),
                                        //       Text(
                                        //         AppLocalizations.of(context)!.more,
                                        //         style: TextStyle(
                                        //           color: AppColors.primaryColor,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        //   onTap: () {
                                        //     navigateTo(
                                        //       context: context,
                                        //       widget: RecommendationScreen(),
                                        //     );
                                        //   },
                                        // ),
                                      ],
                                    ),
                                    Container(
                                      height: 173.0,
                                      width: double.infinity,
                                      child: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            buildHomeItem(
                                                cubit.CatRecommended[index],
                                                context),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: 10.0,
                                        ),
                                        itemCount: cubit.CatRecommended.length,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ): SizedBox(),
                                Text(
                                  'Suggested for your age',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.6,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  height: 173.0,
                                  width: double.infinity,
                                  child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        buildHomeItem(
                                      cubit.ageRecommended[index],
                                      context,
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 10.0,
                                    ),
                                    itemCount: cubit.ageRecommended.length,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Recommended by users',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.5,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.more_horiz_rounded,
                                            color: AppColors.primaryColor,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.more,
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        navigateTo(
                                          context: context,
                                          widget: RecommendationScreen(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 173.0,
                                  width: double.infinity,
                                  child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        buildHomeItem(
                                            cubit.recommended[index], context),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 10.0,
                                    ),
                                    itemCount: cubit.recommended.length,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Not recommended by users',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  height: 173.0,
                                  width: double.infinity,
                                  child: ListView.separated(
                                    itemBuilder: (context, index) =>
                                        buildHomeItem(
                                            cubit.notRecommended[index],
                                            context),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 10.0,
                                    ),
                                    itemCount: cubit.notRecommended.length,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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


Widget buildHomeItem(HomePlaces model, context) => InkWell(
      onTap: () {
        AppCubit.get(context).getPlaceDetails(
          placeId: model.id,
        );
        navigateTo(
          context: context,
          widget: PlaceDetailsScreen(),
        );
      },
      child: Container(
        height: 178.0,
        width: 148.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            16.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 112.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${model.image}'),
                        fit: BoxFit.cover,
                      )),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage('${model.image}'),
                  ),
                ),
              ),
              Spacer(),
              Text(
                '${model.placeName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RatingBarIndicator(
                    rating: model.rate.toDouble(),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: AppColors.primaryColor,
                    ),
                    itemCount: 5,
                    itemSize: 18,
                    direction: Axis.horizontal,
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/icons/goto.svg',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget HomeRow({
  required String text,
  required String iconPath,
}) =>
    Container(
      height: 39.0,
      width: 299,
      decoration: BoxDecoration(
        color: AppColors.secondColor,
        borderRadius: BorderRadius.circular(
          19.0,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(
              0x16000000,
            ),
            spreadRadius: 3,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 9.5,
          ),
          SvgPicture.asset(
            iconPath,
          ),
          const SizedBox(
            width: 7.5,
          ),
          Text(
            text.toUpperCase(),
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );

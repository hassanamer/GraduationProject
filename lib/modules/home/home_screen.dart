import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.heoModel != null,
          builder: (context) => SingleChildScrollView(
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
                          width: 280,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              11.0,
                            ),
                          ),
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
                                AppLocalizations.of(context)!.where_to_go,
                                style: TextStyle(
                                  color: AppColors.disabledAndHintColor,
                                ),
                              ),
                              SizedBox(
                                width: 95.0,
                              ),
                              SvgPicture.asset(
                                'assets/icons/mic.svg',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: HomeRow(
                            text: AppLocalizations.of(context)!.events,
                            iconPath: 'assets/icons/events.svg',
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: HomeRow(
                            text: AppLocalizations.of(context)!.offers,
                            iconPath: 'assets/icons/offers.svg',
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: HomeRow(
                            text: AppLocalizations.of(context)!.plan,
                            iconPath: 'assets/icons/plan.svg',
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
                      left: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.popular_places,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21.0,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.popular_places_in_egypt,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Container(
                          height: 178.0,
                          width: double.infinity,
                          child: ListView.separated(
                            itemBuilder: (context, index) => buildPopularItem(
                              cubit.heoModel!.data!.popularPlaces![index],
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10.0,
                            ),
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
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

Widget buildPopularItem(PopularPlaces model) => Container(
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
                child: SizedBox(
              height: 106.5,
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage('${model.image}'),
              ),
            )),
            Text(
              '${model.placeName}',
              maxLines: 1,
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(false, 18),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/goto.svg',
                )
              ],
            ),
          ],
        ),
      ),
    );

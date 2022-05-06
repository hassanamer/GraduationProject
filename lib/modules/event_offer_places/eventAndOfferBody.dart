import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/cat_places_model.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/textStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class eventAndOfferBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: cubit.cpModel != null,
            builder: (context) => SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 5,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: ListView.separated(
                    itemBuilder: (context, index) => buildOfferItem(
                        context, cubit.cpModel!.data!.category![index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 12,
                    ),
                    itemCount: cubit.cpModel!.data!.category!.length,
                  ),
                ),
              ),
            ),
            fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          );
        });
  }
}

Widget buildOfferItem(BuildContext context, Category model) => Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: textStyle(
                  model.name!,
                  22,
                  FontWeight.bold,
                )),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            onTap: () {
              navigateTo(
                widget: PlaceDetailsScreen(),
                context: context,
              );
            },
            child: textStyle.normal('someDetails', 16),
          ),
          const SizedBox(
            width: 40,
          ),
        ]),
        // Container(
        //   margin: const EdgeInsets.all(8),
        //   child: Image.asset(model.),
        // ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          InkWell(
              child: SvgPicture.asset(
                'assets/icons/active_navigate.svg',
              ),
              onTap: () {
                Navigator.of(context).pushNamed(PlaceDetailsScreen.routeName);
              }),
          const SizedBox(
            width: 5,
          ),
          textStyle.normal(AppLocalizations.of(context)!.see_details, 14),
          const SizedBox(
            width: 30,
          )
        ]),
      ],
    );

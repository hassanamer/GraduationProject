import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/places/iconOfRate.dart';
import 'package:smarttouristguide/modules/Place%20Details/place_details_screen.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../../layout/cubit/cubit.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../event_offer_places/places/placeDetailsScreen.dart';
import '../textStyle.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlacesBody extends StatelessWidget {
  final String hidder;
  final String someDetails;
  final String pathOfImage;
  PlacesBody(this.hidder, this.someDetails, this.pathOfImage);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: textStyle(
                            hidder,
                            22,
                            FontWeight.bold,
                          )),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    textStyle.normal('someDetails', 16),
                    const SizedBox(
                      width: 40,
                    ),
                  ]),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: Image.asset(pathOfImage),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    rate(),
                    rate(),
                    rate(),
                    rate(),
                    rate(),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        //na2as hana ano yro7 3la al place details
                      },
                      child: const Icon(Icons.assistant_navigation,
                          color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(PlaceDeatilsScreen.routeName);
                      },
                      child: textStyle.normal(
                          AppLocalizations.of(context)!.see_details, 14),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        ChangeColorCubit.get(context).changeColorIcon();
                      },
                      icon: const Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                      color: ChangeColorCubit.get(context).x,
                    ),
                    const SizedBox(
                      width: 15,
                    )
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

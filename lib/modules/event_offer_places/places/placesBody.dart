import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttouristguide/modules/event_offer_places/places/placeDetailsScreen.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../../shared/styles/textStyle.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import 'iconOfRate.dart';

class PlacesBody extends StatelessWidget {
  final String hidder;
  final String someDetails;
  final String pathOfImage;
  PlacesBody(this.hidder, this.someDetails, this.pathOfImage);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChangeColorCubit(),
      child: BlocConsumer<ChangeColorCubit, ChangesStates>(
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
                    SizedBox(width: 10),
                    rate(),
                    rate(),
                    rate(),
                    rate(),
                    rate(),
                    const Spacer(),
                    InkWell(
                      child: SvgPicture.asset(
                        'assets/icons/active_navigate.svg',
                      ),
                      onTap: () {
                        {
                          Navigator.of(context)
                              .pushNamed(PlaceDetailsScreen.routeName);
                        }
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    textStyle.normal('see Details', 14),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        ChangeColorCubit.get(context).changeColorIcon();
                      },
                      child: Icon(
                        Icons.favorite,
                        color: ChangeColorCubit.get(context).x,
                        size: 30,
                      ),
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

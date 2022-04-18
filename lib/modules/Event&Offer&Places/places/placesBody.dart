import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/modules/Event&Offer&Places/places/iconOfRate.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../textStyle.dart';

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

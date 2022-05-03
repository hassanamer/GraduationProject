import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/modules/place_details/place_details_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import '../../../models/cat_places_model.dart';

class PlacesScreen extends StatelessWidget {
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
            title: const Text(
              'Places',
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
          body: ConditionalBuilder(
            condition: cubit.cpModel != null,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildPlacesItem(context, cubit.cpModel!.data!.category![6].info!.places![index]),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemCount: cubit.cpModel!.data!.category![6].info!.places!.length,
            ),
            fallback: (context) => Center(
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

Widget buildPlacesItem(context, Places model) => Container(
      height: 241.0,
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
              '${model.placeName}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              'The great pyramids of Giza',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blueGrey[700],
              ),
            ),
            Container(
              height: 140.0,
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '${model.image}'
                ),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  size: 19,
                  color: AppColors.primaryColor,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  size: 19,
                  color: AppColors.primaryColor,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  size: 19,
                  color: AppColors.primaryColor,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  size: 19,
                  color: AppColors.primaryColor,
                ),
                Icon(
                  Icons.star_rate_rounded,
                  size: 19,
                  color: AppColors.disabledAndHintColor,
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


// Widget old() => Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: AppBar(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(
//               16.0,
//             ),
//             bottomRight: Radius.circular(
//               16.0,
//             ),
//           ),
//         ),
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: AppColors.primaryColor,
//           statusBarIconBrightness: Brightness.light,
//         ),
//         centerTitle: true,
//         title: const Text(
//           'Places',
//         ),
//         backgroundColor: AppColors.primaryColor,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search,
//             ),
//           ),
//         ],
//       ),
//       body: ListViewOfPlaces(),
//     );

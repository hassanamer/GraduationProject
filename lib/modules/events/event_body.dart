import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/layout/cubit/states.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/shared/components/extensions.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class EventBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => buildEvent(
            context,
            cubit.homeModel!.data.events[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 12,
          ),
          itemCount: cubit.homeModel!.data.events.length,
        );
      },
    );
  }
}

Widget buildEvent(BuildContext context, Events model) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 13.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model.eventName.capitalize()}',
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.location_on_rounded,
            //       color: AppColors.primaryColor,
            //     ),
            //     SizedBox(
            //       width: 4.0,
            //     ),
            //     Text(
            //       '${model.city}',
            //       style: TextStyle(
            //         fontSize: 16.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Icon(
                  Icons.date_range_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'From: ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model.dateFrom.substring(0, 12)}',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.date_range_rounded,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'To: ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model.dateTo.substring(0, 12)}',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage('${model.eventImage}'),
                ),
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.zero,
                title: Row(
                  children: [
                    Icon(
                      Icons.info_rounded,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'Details',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                tilePadding: EdgeInsets.zero,
                children: [
                  Text(
                    '${model.description}',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

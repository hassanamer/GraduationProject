import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smarttouristguide/modules/events/event_body.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class EventsScreen extends StatelessWidget {
  static const String routeName = 'EventScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
        title: Text(
          'Events',
          style: TextStyle(
            fontSize: 17.5,
          ),
        ),
      ),
      body: EventBody(),
    );
  }
}

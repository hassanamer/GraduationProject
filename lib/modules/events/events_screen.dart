import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/events/event_body.dart';
import '../../shared/styles/colors.dart';
import '../place_details/place_details_screen.dart';

class EventsScreen extends StatelessWidget {
  static const String routeName = 'EventScreen';

  const EventsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event'),
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, PlaceDetailsScreen.routeName);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: EventBody(),
    );
  }
}
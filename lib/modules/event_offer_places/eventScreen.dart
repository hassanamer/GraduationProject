import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import 'ListVievOfEventAndOffer.dart';
class EventScreen extends StatelessWidget {
  static const String routeName = 'EventScreen';

  const EventScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event'),
        backgroundColor: AppColors.primaryColor,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListVievOfEventAndOffer(),
    );
  }
}

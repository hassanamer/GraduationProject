import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';
import 'ListVievOfEventAndOffer.dart';

class OfferScreen extends StatelessWidget {
  static const String routeName = 'OfferScreen';

  const OfferScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Offers'),
        backgroundColor: AppColors.primaryColor,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListVievOfEventAndOffer(),
    );
  }
}

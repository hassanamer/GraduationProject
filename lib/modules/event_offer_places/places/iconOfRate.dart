import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../cubit/cubit.dart';

class rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.star_rate_sharp,
          color: AppColors.primaryColor,
          size: 18,
        ),
      ),
    );
  }
}

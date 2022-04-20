import 'package:flutter/material.dart';

import '../../cubit/cubit.dart';

class rate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          ChangeColorCubit.get(context).changeColorIcon();
        },
        child: Icon(
          Icons.star_rate_sharp,
          color: ChangeColorCubit.get(context).x,
          size: 14,
        ),
      ),
    );
  }
}

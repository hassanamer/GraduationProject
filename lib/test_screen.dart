import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:smarttouristguide/layout/cubit/cubit.dart';
import 'package:smarttouristguide/models/home_model.dart';
import 'package:smarttouristguide/shared/components/components.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(condition: AppCubit.get(context).homeModel != null, builder: (context) => ListView.separated(
      itemBuilder: (context, index) => listtt(AppCubit.get(context).homeModel!.data.home_places[index]),
      separatorBuilder: (context, index) => divider(),
      itemCount: AppCubit.get(context).homeModel!.data.home_places.length,
    ), fallback: (context) => CircularProgressIndicator());
  }

  Widget listtt(home_place model) => Container(
    height: 200,
    width: double.infinity,
    color: Colors.red,
    child: Text('${model.placeName}'),
  );
}

import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/cubit/cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'modules/cubit/states.dart';

class AskUser extends StatelessWidget {
  static const routeName = 'AskUser';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeColorCubit, ChangesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChangeColorCubit.get(context);

        return Scaffold(
          body: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Safari',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(cubit.checkBox),
                            onPressed: () {
                              cubit.changePasswordVisibility();
                              print('${cubit.checkBox}');
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Eco',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank_sharp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Islamic',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank_sharp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Coptic',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank_sharp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Cultural',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank_sharp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Beach',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank_sharp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Leisure',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank_sharp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Medical',
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_box_outline_blank_sharp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.primaryColor),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Continue'),
                    )),
                SizedBox(
                  height: 20,
                )
              ])),
        );
      },
    );
  }
}
// ElevatedButton(
// onPressed: () {
// Navigator.pushReplacementNamed(
// context, HomeScreen.routeName);
// },
// child: Text('Continue'),
// ),

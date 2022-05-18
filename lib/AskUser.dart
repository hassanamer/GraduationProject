import 'package:flutter/material.dart';
import 'package:smarttouristguide/modules/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'modules/cubit/states.dart';

class AskUser extends StatelessWidget {
  static const routeName = 'AskUser';
  List SelectCatItem = [];

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
                              SelectCatItem.add('Safari');
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
                            icon: Icon(cubit.checkBox1),
                            onPressed: () {
                              cubit.changePasswordVisibility1();
                              SelectCatItem.add('Eco');
                            },
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
                            icon: Icon(cubit.checkBox2),
                            onPressed: () {
                              cubit.changePasswordVisibility2();
                              SelectCatItem.add('Islamic');
                            },
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
                            icon: Icon(cubit.checkBox3),
                            onPressed: () {
                              cubit.changePasswordVisibility3();
                              SelectCatItem.add('Coptic');
                            },
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
                            icon: Icon(cubit.checkBox4),
                            onPressed: () {
                              cubit.changePasswordVisibility4();
                              SelectCatItem.add('Cultural');
                            },
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
                            icon: Icon(cubit.checkBox5),
                            onPressed: () {
                              cubit.changePasswordVisibility5();
                              SelectCatItem.add('Beach');
                            },
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
                            icon: Icon(cubit.checkBox6),
                            onPressed: () {
                              cubit.changePasswordVisibility6();
                              SelectCatItem.add('Leisure');
                            },
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
                            icon: Icon(cubit.checkBox7),
                            onPressed: () {
                              cubit.changePasswordVisibility7();
                              SelectCatItem.add('Medical');
                            },
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
                        CatItems();
                        print(CatItems());
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

  List CatItems() {
    return SelectCatItem;
  }
}

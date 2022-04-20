import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:smarttouristguide/shared/styles/textStyle.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 168.07,
                          width: 320.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 70.0,
                                  backgroundImage:
                                      AssetImage('assets/testpic.jpg'),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width - 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.person_pin, color: AppColors.primaryColor,),
                                  ), Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: textStyle('Hassan Mohamed ', 20.0 , FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width - 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.email_rounded, color: AppColors.primaryColor,),
                                  ), Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: textStyle('hassanamer281@gmail.com ', 20.0 , FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width - 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.lock, color: AppColors.primaryColor,),
                                  ), Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: textStyle('**************** ', 20.0 , FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width - 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.date_range, color: AppColors.primaryColor,),
                                  ), Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: textStyle('30 / 4 / 2022 ', 20.0 , FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width - 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.language_outlined, color: AppColors.primaryColor,),
                                  ), Padding(
                                    padding: const EdgeInsets.only(left: 90.0),
                                    child: textStyle('Egypt', 20.0 , FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width - 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.phone, color: AppColors.primaryColor,),
                                  ), Padding(
                                    padding: const EdgeInsets.only(left: 70.0),
                                    child: textStyle('01111302839', 20.0 , FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: MediaQuery.of(context).size.width - 80.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.male_outlined, color: AppColors.primaryColor,),
                                  ), Padding(
                                    padding: const EdgeInsets.only(left: 90.0),
                                    child: textStyle('Male', 20.0 , FontWeight.bold),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),

              ]),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../user/user_screen.dart';

class CreateNewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Icon(
              Icons.menu,
              color: Palette.primaryColor,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()),
                  );
                },
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Palette.primaryColor,
                ),
              )
            ],
          ),
          body: Stack(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 110.0,
                    ),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Create New Password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Enter your registered email below',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, top: 210.0, right: 40.0),
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(color: AppColors.primaryColor),
                          decoration: InputDecoration(
                              labelText: 'New Password',
                              suffixIcon: Icon(Icons.remove_red_eye_outlined,
                                  color: AppColors.primaryColor),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0))),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          style: TextStyle(color: AppColors.primaryColor),
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              errorStyle: TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle:
                                  TextStyle(color: AppColors.primaryColor),
                              hintStyle: TextStyle(color: AppColors.primaryColor),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              filled: true,
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.primaryColor,
                              ),
                              fillColor: Colors.grey.shade100,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                        ),
                        SizedBox(
                          height: 180.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reset Password",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            ),
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: AppColors.primaryColor,
                              child: IconButton(
                                onPressed: () {},
                                color: Colors.white,
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

    );
  }
}

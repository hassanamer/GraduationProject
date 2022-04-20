import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

import '../../user/user_screen.dart';

class CreateNewPassword extends StatelessWidget {
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 60.0,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text("Create New Password?",
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontFamily: 'Tajwal',
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                              const SizedBox(height: 5.0),

                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40.0,
                              child: TextFormField(
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: AppColors.primaryColor,
                                    ),
                                    hintText: 'Confirm Password',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.0,
                                        ))),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40.0,
                              child: TextFormField(
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: AppColors.primaryColor,
                                    ),
                                    hintText: 'Confirm Password',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.0,
                                        ))),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 310.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15),
                              child: ButtonTheme(
                                height: 50,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              width: MediaQuery.of(context).size.width - 80,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}

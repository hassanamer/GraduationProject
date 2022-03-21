import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 6,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor: AppColors.primaryColor,
                            child: Icon(
                              Icons.done_rounded,
                              size: 70.0,
                            ),
                            radius: 40.0,
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Success",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Please check your Email to create",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "A new password",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Can\'t Get Email ?',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Resubmit',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold)))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 256.0,
                        height: 49.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(15.0)))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
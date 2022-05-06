import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessScreentwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Column(children: [
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
                      AppLocalizations.of(context)!.success,
                      style: TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      AppLocalizations.of(context)!
                          .congratulation_your_password_has,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      AppLocalizations.of(context)!.been_changed,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)))),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}

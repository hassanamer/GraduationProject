import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckMail extends StatelessWidget {
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
                            AppLocalizations.of(context)!.success,
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            AppLocalizations.of(context)!.check_your_email,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            AppLocalizations.of(context)!.new_password,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .can_not_get_email,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                      AppLocalizations.of(context)!.resubmit,
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.13,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.submit,
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

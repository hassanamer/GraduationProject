import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smarttouristguide/modules/login/login_and_signup/login_screen.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/components/components.dart';
import '../../welcome_screen/welcome_screen.dart';

class ForgetPassword extends StatelessWidget {

  static const String routeName = 'UserProfile';
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  resetPassword() async {

    String email = _emailController.text.toString();
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
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
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 35.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width,
                  child: // Image.asset('assets/images/recover_password.png'),
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.lock_outline,
                      size: 100.0,
                    ),
                    radius: 10.0,
                  ),
                ),
              ),
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
                                    Text("Forget Password?",
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontFamily: 'Tajwal',
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                              const SizedBox(height: 5.0),
                              Row(

                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .forget_password_state_one,
                                    style: const TextStyle(
                                        fontFamily: 'Tajwal',
                                        fontSize: 18.0,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .forget_password_state_two,
                                    style: const TextStyle(
                                        fontFamily: 'Tajwal',
                                        fontSize: 18.0,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )
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
                                controller:_emailController,
                                style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w300),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.check_circle,
                                      color: AppColors.primaryColor,
                                    ),
                                    hintText: 'Email address',
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
                        const SizedBox(height: 4.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: Text(
                                    '',
                                    style: const TextStyle(
                                        fontFamily: 'Tajwal',
                                        color: AppColors.primaryColor,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Welcome()),
                                      );
                                    },
                                    child: const Text('Sign in',
                                        style: TextStyle(
                                            fontFamily: 'Tajwal',
                                            fontSize: 20.0,
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold)))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 120.0),
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
                                  onPressed: ()
                                  async {
                                    resetPassword();
                                    navigateAndFinish(
                                      context: context,
                                      widget: LoginScreen(),
                                    );
                                  },

                                  child: Center(
                                      child: Text(
                                        AppLocalizations.of(context)!.recover,
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
import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'login_screen.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  // static const String routeName = 'loginButton';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 80),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primaryColor),
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all((Colors.transparent))),
        onPressed: () {
          showModalBottomSheet(
              isDismissible: false,
              enableDrag: false,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Container(
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        color: Colors.white),
                    child: LoginScreen());
              });
        },
        child: Text(AppLocalizations.of(context)!.login),
      ),
    );
  }
}

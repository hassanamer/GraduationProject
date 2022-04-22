import 'package:flutter/material.dart';
import 'LoginButton.dart';
import 'SignUpButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Welcome extends StatelessWidget {
  static const String routeName = 'welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo2.png'),
                    Text(
                      AppLocalizations.of(context)!.welcome_text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(AppLocalizations.of(context)!.welcome_state_one),
                    Text(AppLocalizations.of(context)!.welcome_state_two),
                  ],
                ),
              ),
            ),
            SignUpButton(),
            LoginButton(),
            const SizedBox(
              height: 60,
            )
            // buttons('Login', DoFunction)
          ],
        ),
      ),
    );
  }
}

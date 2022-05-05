import 'package:smarttouristguide/modules/login/login_and_signup/welcome_screen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then(
    (value) {
      if (value) {
        navigateAndFinish(
          widget: WelcomeScreen(),
          context: context,
        );
      }
    },
  );
}


String token = '';

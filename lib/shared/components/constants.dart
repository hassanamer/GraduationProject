import 'package:smarttouristguide/modules/login/login_and_signup/welcomScreen.dart';
import 'package:smarttouristguide/shared/components/components.dart';
import 'package:smarttouristguide/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then(
    (value) {
      if (value) {
        navigateAndFinish(
          widget: Welcome(),
          context: context,
        );
      }
    },
  );
}

String token = 'Token 53b704f45ca09497409820590b3fc8874eaec03e';

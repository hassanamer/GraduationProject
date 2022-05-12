import 'package:smarttouristguide/modules/welcome_screen/welcome_screen.dart';
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


String token = '';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/shared/styles/buttons_style.dart';

import '../place_details/place_details_screen.dart';

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178.0,
      width: 148.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SizedBox(
                  height: 106.5,
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://i.pinimg.com/originals/9e/df/6b/9edf6b06f5699d16b7d04a2741e605f0.jpg'),
                  ),
                )),
            Text(
              'Hello Test',
              maxLines: 1,
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(true, 18),
                RateIcon(false, 18),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/goto.svg',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

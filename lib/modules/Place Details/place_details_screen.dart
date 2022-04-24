import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlaceDeatilsScreen extends StatelessWidget {
  var mediaController = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dream Park',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                    Text(
                      'Giza, 6 of Ocober',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Leisure tourism',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 179,
                  child: ListView.builder(
                    controller: mediaController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => hazem(),
                    itemCount: 3,

                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: mediaController,
                    count: 3,
                    effect: const ScrollingDotsEffect(
                      dotHeight: 9.0,
                      dotWidth: 9.0,
                      spacing: 4.0,
                      activeDotScale: 1,
                      activeDotColor: AppColors.primaryColor,
                      dotColor: Color(0xffe2e2e2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget hazem() => Container(
      height: 179,
      width: 333,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/dream.jpg',
          ),
        ),
      ),
    );

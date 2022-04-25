import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarttouristguide/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PlaceDeatilsScreen extends StatelessWidget {
  var mediaController = PageController();

  static const String routeName = 'PlaceDeatilsScreen';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
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
                          'Giza, 6 of October',
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
                    SizedBox(
                      height: 179,
                      child: ListView.builder(
                        controller: mediaController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => hazem(),
                        itemCount: 3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: mediaController,
                        count: 3,
                        effect: const ScrollingDotsEffect(
                          dotHeight: 7.5,
                          dotWidth: 7.5,
                          spacing: 3.2,
                          activeDotScale: 1,
                          activeDotColor: AppColors.primaryColor,
                          dotColor: Color(0xffe2e2e2),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.primaryColor,
                          size: 20.0,
                        ),
                        const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.primaryColor,
                          size: 20.0,
                        ),
                        const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.primaryColor,
                          size: 20.0,
                        ),
                        const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.primaryColor,
                          size: 20.0,
                        ),
                        const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.disabledAndHintColor,
                          size: 20.0,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/location.svg',
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'GPS Location',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Dream Park',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dreampark is the leading amusement Park in Egypt & the Middle East. The Park was established in 1999 and designed by The Famous Canadian Architecture Company which is Forrec, designed Universal Studios and Mall of America. Dreampark is a member of IAAPA ( International Association of Amusement Parks and attractions).',
                      style: TextStyle(
                        color: AppColors.bodyDetailsColor,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Container(
                        width: 285.0,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(
                              20,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 5.0,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Visit Webiste',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/website.svg',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
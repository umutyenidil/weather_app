
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      child: Column(
        children: [
          SizedBox.square(
            dimension: 100.r,
            child: Container(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SvgPicture.asset(
                  'assets/icons/weather_icons/sunny2.svg',
                ),
              ),
            ),
          ),
          8.verticalSpace,
          Text(
            '00:12 PM',
            style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 25.sp,
            ),
          ),
          8.verticalSpace,

          Text(
            '23°',
            style: TextStyle(
              fontSize: 56.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

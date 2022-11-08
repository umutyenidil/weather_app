import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/paths/my_images.dart';

Widget get weatherStatusText {
  return Text(
    'It\'s Sunny',
    style: TextStyle(
      fontSize: 50.sp,
      color: Colors.white,
    ),
  );
}

Widget get degreeText {
  return Text(
    '23°',
    style: TextStyle(
      fontSize: 256.sp,
      color: Colors.white,
    ),
  );
}

Widget get cityText {
  return Text(
    'Isparta',
    style: TextStyle(
      fontSize: 40.sp,
      color: Colors.white,
    ),
  );
}

Widget get decorativeIconPin {
  return SizedBox.square(
    dimension: 64.r,
    child: SvgPicture.asset(
      'assets/icons/pin-icon.svg',
      color: Colors.white,
    ),
  );
}

Widget get backgroundImage {
  return Container(
    width: 1.sw,
    height: 1.sh,
    child: FittedBox(
      fit: BoxFit.cover,
      child: SvgPicture.asset(
        MyImages.nightImage,
      ),
    ),
  );
}

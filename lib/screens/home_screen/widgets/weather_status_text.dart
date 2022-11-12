import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherStatusText extends StatelessWidget {
  Widget build(BuildContext context) {
    return Text(
      'It\'s Sunny',
      style: TextStyle(
        fontSize: 50.sp,
        color: Colors.white,
      ),
    );
  }
}

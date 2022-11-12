import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DecorativeIconPin extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 64.r,
      child: SvgPicture.asset(
        'assets/icons/pin-icon.svg',
        color: Colors.white,
      ),
    );
  }
}

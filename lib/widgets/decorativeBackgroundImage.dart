import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/paths/my_images.dart';

class DecorativeBackgroundImage extends StatelessWidget {
  const DecorativeBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

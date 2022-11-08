
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox.square(
        dimension: 64.r,
        child: Transform.scale(
          child: SvgPicture.asset(
            'assets/icons/menu-icon.svg',
            color: Colors.white,
          ),
          scaleX: -1,
        ),
      ),
    );
  }
}

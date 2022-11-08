import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/bottom_bar.dart';
import 'widgets/menu_button.dart';
import 'widgets/others.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            backgroundImage,
            SafeArea(
              child: Column(
                children: [
                  32.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Row(
                      children: [
                        decorativeIconPin,
                        8.horizontalSpace,
                        cityText,
                        Spacer(),
                        MenuButton(),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        degreeText,
                        Spacer(),
                        RotatedBox(
                          quarterTurns: 3,
                          child: weatherStatusText,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  BottomBar(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

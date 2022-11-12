import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/paths/myLotties.dart';
import 'package:weather_app/widgets/decorativeBackgroundImage.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {

    _controller.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            DecorativeBackgroundImage(),
            Container(
              width: 1.sw,
              height: 1.sh,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                child: Center(
                  child: SizedBox.square(
                    dimension: (256 * 2).r,
                    child: Lottie.asset(
                      MyLotties.weatherLoadingLottie,
                      controller: _controller,
                      onLoaded: (LottieComposition composition) {
                        _controller
                          ..duration = Duration(milliseconds: (composition.duration.inMilliseconds * 0.3).toInt())
                          ..forward()
                          ..repeat();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

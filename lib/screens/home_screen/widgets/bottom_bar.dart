import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/paths/my_icons.dart';
import 'package:weather_app/paths/my_images.dart';

import 'weather_card.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: BlocProvider.of<WeatherBloc>(context),
      builder: (context, state) {
        List<Forecast> data = (state as LoadedWeatherState).weatherData.forecasts;
        return Container(
          width: 1.sw,
          height: 350.h,
          child: Stack(
            children: [
              backgroundImage,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 270.h,
                  width: 0.9.sw,
                  child: Column(
                    children: [
                      decorativeContainer,
                      16.verticalSpace,
                      decorativeTextWeatherToday,
                      Spacer(),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: WeatherCard(
                              image: MyIcons.cloudIcon,
                              temperature: data[0].high.toString(),
                              description: data[0].text.toString(),
                            )),
                            4.horizontalSpace,
                            Expanded(
                                child: WeatherCard(
                              image: MyIcons.cloudIcon,
                              temperature: data[1].high.toString(),
                              description: data[1].text.toString(),
                            )),
                            4.horizontalSpace,
                            4.horizontalSpace,
                            Expanded(
                                child: WeatherCard(
                              image: MyIcons.cloudIcon,
                              temperature: data[2].high.toString(),
                              description: data[2].text.toString(),
                            )),
                            4.horizontalSpace,
                            4.horizontalSpace,
                            Expanded(
                                child: WeatherCard(
                              image: MyIcons.cloudIcon,
                              temperature: data[3].high.toString(),
                              description: data[3].text.toString(),
                            )),
                            4.horizontalSpace,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get decorativeTextWeatherToday {
    return Text(
      'Weather Today',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 32.sp,
      ),
    );
  }

  Widget get decorativeContainer {
    return Container(
      width: 60.w,
      height: 5.r,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(2.5.r),
      ),
    );
  }

  Widget get backgroundImage {
    return SizedBox(
      width: 1.sw,
      height: 350.h,
      child: FittedBox(
        fit: BoxFit.fill,
        child: SvgPicture.asset(
          MyImages.bottomBarBackgroundImage,
        ),
      ),
    );
  }
}

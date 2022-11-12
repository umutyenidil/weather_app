import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/screens/home_screen/widgets/city_text.dart';
import 'package:weather_app/screens/loadingScreen/loadingScreen.dart';
import 'package:weather_app/widgets/decorativeBackgroundImage.dart';
import 'package:weather_app/screens/home_screen/widgets/decorative_icon_pin.dart';
import 'package:weather_app/screens/home_screen/widgets/degree_text.dart';
import 'package:weather_app/screens/home_screen/widgets/weather_status_text.dart';

import 'widgets/bottom_bar.dart';
import 'widgets/menu_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    super.initState();

    weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(GetWeatherEvent(cityName: 'Isparta'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        bloc: weatherBloc,
        builder: (context, state) {
          if (state is LoadingWeatherState) {
            return LoadingScreen();
          } else if (state is LoadedWeatherState) {
            var data = state.weatherData;
            return homeScreenContent;
          } else {
            return Container(
              child: Text('hata'),
            );
          }
        },
      ),
    );
  }

  Widget get homeScreenContent {
    return Container(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          DecorativeBackgroundImage(),
          SafeArea(
            child: Column(
              children: [
                32.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Row(
                    children: [
                      DecorativeIconPin(),
                      8.horizontalSpace,
                      CityText(),
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
                      DegreeText(),
                      Spacer(),
                      RotatedBox(
                        quarterTurns: 3,
                        child: WeatherStatusText(),
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
    );
  }
}

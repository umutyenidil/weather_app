import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';

class DegreeText extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: BlocProvider.of<WeatherBloc>(context),
      builder: (context, state) {
        String data = (state as LoadedWeatherState).weatherData.currentObservation.condition.temperature.toString();
        return Text(
          '$data°',
          style: TextStyle(
            fontSize: 256.sp,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

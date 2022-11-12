import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/datas/datas.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locationSelect(context);
      },
      child: SizedBox.square(
        dimension: 64.r,
        child: Transform.scale(
          child: SvgPicture.asset(
            'assets/icons/search-icon.svg',
            color: Colors.white,
          ),
          scaleX: -1,
        ),
      ),
    );
  }

  void locationSelect(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Center(
            child: Container(
              width: 0.8.sw,
              height: 0.7.sh,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 100.h,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
                          weatherBloc.add(GetWeatherEvent(cityName: provinces[index]));
                        },
                        child: Text(
                          provinces[index],
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        minWidth: double.infinity,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 0.5,
                      color: Colors.black.withOpacity(0.3),
                      margin: EdgeInsets.symmetric(horizontal: 32.w),
                    );
                  },
                  itemCount: 81,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

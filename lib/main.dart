import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/screens/screens.dart';

void main() async {

  Locator.setupLocator();

  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));


  runApp(Main());
}

class Main extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return BlocProvider(
          create: (context) => WeatherBloc(),
          child: MaterialApp(
            title: 'Weather App',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoute,
            theme: ThemeData(
              fontFamily: 'Urbanist',
            ),
          ),
        );
      },
    );
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
    }
  }
}

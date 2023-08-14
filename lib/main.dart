import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_cubit.dart';
import 'package:weather/models.dart';
import 'package:weather/pages/home_bage.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider.dart';
import 'package:weather/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit(weatherservices());
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
//weathermodel? weather;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel== null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context)
                .weatherModel!
                .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cubit.dart';
import 'package:weather/models.dart';
import 'package:weather/provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  //const SearchPage({Key? key}) : super(key: key);
  String? cityname;
  VoidCallback ?updateui;

  SearchPage({this.updateui});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityname = data;
            },
            onSubmitted: (data) async {
              cityname = data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityname!);
              BlocProvider.of<WeatherCubit>(context).cityname= cityname!;

              Navigator.pop(context);

            },
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                label: Text('search'),
                suffixIcon: GestureDetector(child: GestureDetector(
                    onTap: ()async{


                      weatherservices services = weatherservices();
                      weathermodel? weather =
                          await services.getWeather(cityname: cityname!);
                      Provider.of<weatherProvider>(context,listen: false).weatherData=weather;
                      Provider.of<weatherProvider>(context,listen: false).cityname=cityname;
                      Navigator.pop(context);

                    },
                    child: Icon(Icons.search))),
                hintText: 'Enter a city',
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}


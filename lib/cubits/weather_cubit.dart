import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/weather_states.dart';

import '../models.dart';
import '../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(this.weatherServices):super(WeatherInitial());
  weatherservices weatherServices;
  String? cityname;

  weathermodel?weatherModel;

  void getWeather({required String cityName})async{
    emit(WeatherLoading());
    try{

weatherModel=await weatherServices.getWeather(cityname: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));

    }on Exception catch(e){
emit(WeatherFailure());


    }



  }



}
import 'package:weather/models.dart';

abstract class WeatherStates {}
class WeatherInitial extends WeatherStates{}

class WeatherLoading extends WeatherStates{}
class WeatherSuccess extends WeatherStates{
  weathermodel weatherModel;
  WeatherSuccess({required this.weatherModel});


}
class WeatherFailure extends WeatherStates{}
import 'package:flutter/cupertino.dart';
import 'package:weather/models.dart';

class weatherProvider extends ChangeNotifier{
  weathermodel? _weatherData;
  String? cityname;



  set weatherData(weathermodel? weather) {
    _weatherData = weather;
    notifyListeners();
  }
  weathermodel? get weatherData => _weatherData;

}
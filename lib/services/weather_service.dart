import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models.dart';

class weatherservices {
  String baseurl = 'http://api.weatherapi.com/v1';
  String apiKY = '8de5d7c2831046d8b5585317222712';
  Future<weathermodel?> getWeather({required String cityname}) async {
    weathermodel? weather;
    try {
      Uri url = Uri.parse(
          '$baseurl/forecast.json?key=$apiKY&q=$cityname&days=7');

      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = weathermodel.fromjason(data);
    }catch(e){print(e);}
  return weather;
  }
}

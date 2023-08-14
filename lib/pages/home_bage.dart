import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cubit.dart';
import 'package:weather/cubits/weather_states.dart';
import 'package:weather/models.dart';
import 'package:weather/pages/search_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  weathermodel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      //استخدمت البلوك بيلدر لاني مش محتاج ليسنر لو محتاج ليسنر هستخدم البلوك كونسيومر البلدر بيعمل بيلد لليو اي من اول وجديد
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (BuildContext context, state) {
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return SuccessBody(weatherData: state.weatherModel);
          } else if (state is WeatherFailure) {
            return Center(
              child: Text('Something went Wrong please try again'),
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
//       weatherData==null?
//       Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'there is no weather 😔 start',
//               style: TextStyle(
//                 fontSize: 25,
//               ),
//             ),
//             Text(
//               'searching now 🔍',
//               style: TextStyle(
//                 fontSize: 30,
//               ),
//             )
//           ],
//         ),
//
//
//
//       ):
//       Container(
//         decoration: BoxDecoration(
//
//
//
//           gradient: LinearGradient(colors: [
//             weatherData!.getThemeColor(),
//             weatherData!.getThemeColor()[300]!,
//             weatherData!.getThemeColor()[100]!,
//
//           ]
//           ,begin: Alignment.topCenter,
//           end: Alignment.bottomCenter)
//         ),
//        // color: weatherData!.getThemeColor(),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//
//           children: [
//             const Spacer(
//               flex: 3,
//             ),
//             Text( Provider.of<weatherProvider>(context).cityname!,
//
//   style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
//           Text( 'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',  style: TextStyle(fontSize: 22),),
//             Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//             Image.asset(weatherData!.getImage()),
//             Text(  weatherData!.temp.toInt().toString(),
//               style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
//
//             Column(children: [
//               Text('maxTemp :${weatherData!.maxtemp.toInt()}'),
//               Text('minTemp : ${weatherData!.mintemp.toInt()}'),
//
//
//             ],)],),
//             //SizedBox(height: 40,),
// Spacer(),
//             Text(weatherData?.weatherStateName??'',
//             style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),)
//
//
//            , Spacer(
//               flex: 5,
//             ),
//
//         ],),
//
//       ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final weathermodel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData!.getThemeColor(),
        weatherData!.getThemeColor()[300]!,
        weatherData!.getThemeColor()[100]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      // color: weatherData!.getThemeColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityname!,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
            style: TextStyle(fontSize: 22),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData!.temp.toInt().toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text('maxTemp :${weatherData!.maxtemp.toInt()}'),
                  Text('minTemp : ${weatherData!.mintemp.toInt()}'),
                ],
              )
            ],
          ),
          //SizedBox(height: 40,),
          Spacer(),
          Text(
            weatherData?.weatherStateName ?? '',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}

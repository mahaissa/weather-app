// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/searsh_page.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/get_widgets.dart';
import 'package:weather_app/widgets/hour_weather.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/weather_decoration.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var date = DateTime.now();
  WeatherModel? weatherData;
  GetWidgets getWidgets = GetWidgets();
  WeatherDecoration weatherDecoration = WeatherDecoration();
  WeatherService service = WeatherService();
  String city = "";
  HourWeather hourWeather = HourWeather();
  _getPermission() async {
    city = await service.getCurrentCity();
    print(city);
  }

  _getCurrentWeather() async {
    WeatherModel? weather = await service.search(cityName: city);
    Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
    Provider.of<WeatherProvider>(context, listen: false).cityName = city;
  }
  @override
  Widget build(BuildContext context) {
    _getPermission();
    _getCurrentWeather();
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
 

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(homeName: weatherData!.cityName,temp: weatherData!.temp,);
                }));

 
                  

              },
              icon: Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? NoWeatherBody()
          : Container(
              decoration: weatherDecoration.getWeatherDecoration(weatherData!),
              child:
              
              
               SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //CITY NAME
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: weatherData!.cityName!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

//TIME
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" ${DateFormat('EEEE, d MMM').format(date)}",
                        style: TextStyle(fontSize: 22, color: Colors.white)),
                  ),

              

                  //TEMP
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${weatherData!.temp!.toInt()} \u2103",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                      
                            ],
                          ),
                        ),
                        Container(
                            height: 200,
                            width: 200,
                            child: Image.asset(
                              getWidgets
                                  .getImage(weatherData!.weatherStateName!),
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  ),

                  //WEATHER STATE NAME
                  Text(weatherData!.weatherStateName!,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  //MAX AND MIN TEMP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" L: ${weatherData!.minTemp!.toInt()}\u00B0",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                      Text(" H : ${weatherData!.maxTemp!.toInt()}\u00B0",
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                    endIndent: 30,
                    indent: 30,
                  ),
                  getWidgets.sun(weatherData!),
                  Divider(
                    color: Colors.white,
                    endIndent: 30,
                    indent: 30,
                  ),
                  hourWeather.buildHourWeather(weatherData!),
                  Divider(
                    color: Colors.white,
                    endIndent: 5,
                    indent: 5,
                  ),
                  getWidgets.hummidity(weatherData!)
                ],
              ))),
    );
  }
}

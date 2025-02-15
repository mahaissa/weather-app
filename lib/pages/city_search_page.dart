// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/search_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/get_widgets.dart';
import 'package:weather_app/widgets/hour_weather.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_decoration.dart';

class CitySearch extends StatefulWidget {
  final String? cityName;
  CitySearch({required this.cityName});
  @override
  State<CitySearch> createState() => _CitySearchState(cityName);
}

class _CitySearchState extends State<CitySearch> {
  String? cityName;
  _CitySearchState(String? name) {
    cityName = name;
  }

  var date = DateTime.now();
  WeatherModel? weatherData;
  GetWidgets getWidgets = GetWidgets();
  WeatherDecoration weatherDecoration = WeatherDecoration();
  WeatherService service = WeatherService();
  HourWeather hourWeather = HourWeather();
  _getCurrentWeather() async {
    WeatherModel? weatherSearchData = await service.search(cityName: cityName!);
    Provider.of<SearchProvider>(context, listen: false).weatherData =
        weatherSearchData;
    Provider.of<SearchProvider>(context, listen: false).cityName = cityName;
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentWeather();
    weatherData =
        Provider.of<SearchProvider>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? const NoWeatherBody()
          : Container(
              decoration: weatherDecoration.getWeatherDecoration(weatherData!),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //CITY NAME
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: weatherData!.cityName!,
                          style: const TextStyle(
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
                    child: Text("   ${DateFormat('EEEE, d MMM').format(date)}",
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white)),
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
                                style: const TextStyle(
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
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  //MAX AND MIN TEMP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" L: ${weatherData!.minTemp!.toInt()}\u00B0",
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white)),
                      Text(" H : ${weatherData!.maxTemp!.toInt()}\u00B0",
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white)),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    endIndent: 30,
                    indent: 30,
                  ),
                  getWidgets.sun(weatherData!),
                  const Divider(
                    color: Colors.white,
                    endIndent: 30,
                    indent: 30,
                  ),
                  hourWeather.buildHourWeather(weatherData!),
                  const Divider(
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

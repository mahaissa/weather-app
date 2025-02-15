import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  String? cityName;
  // DateTime time;
  double? temp;
  double? minTemp;
  double? maxTemp;
  String? weatherStateName;
  double? windKph;
  double? pressureMb;
  int? humidity;
  Map<String, List<dynamic>> hours;
  String? sunset;
  String? sunrise;

  WeatherModel(
      {required this.date,
      required this.cityName,
      // required this.time,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.humidity,
      required this.windKph,
      required this.pressureMb,
      required this.weatherStateName,
      required this.hours,
      required this.sunrise,
      required this.sunset
      });

//NAMED CONSTRUCTOR SHOLD THE ATTREBUTE IS NULLABLE
  // WeatherModel.fromJason(dynamic data) {
  //   var jsonData = data['forecast']['forecastday'][0];
  //   date = data['location']['localtime'];
  //   temp = jsonData['avgtemp_c'];
  //   maxTemp = jsonData['maxtemp_c'];
  //   minTemp = jsonData['mintemp_c"'];
  //   weatherStateName = jsonData['condition']['text'];
  // }

  // MIX BETWEEN CONSTRUCTOR AND NAMED CONSTRUCTOR IS FACTORY  CONSTRUCTOR
  //  RETURN OBJECT
  // THE OBJECT CAN BE THE SON CLASS IN INHERITANCE
  factory WeatherModel.fromJason(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    var jsonDataHour = data['forecast']['forecastday'][0]['hour'];

    return WeatherModel(
        // time:DateTime.parse(data['created']),
        cityName: data['location']['name'],
        date: data['location']['localtime'],
        temp: data['current']['temp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        weatherStateName: data['current']['condition']['text'],
        humidity: data['current']['humidity'],
        windKph: data['current']['wind_kph'],
        pressureMb:data['current']['pressure_mb'],
        sunrise: data['forecast']['forecastday'][0]['astro']['sunrise'],
        sunset: data['forecast']['forecastday'][0]['astro']['sunset'],
        hours: {
          "12AM": [
            jsonDataHour[0]['temp_c'],
            jsonDataHour[0]['condition']['text']
          ],
          "1AM": [
            jsonDataHour[1]['temp_c'],
            jsonDataHour[1]['condition']['text']
          ],
          "2AM": [
            jsonDataHour[2]['temp_c'],
            jsonDataHour[2]['condition']['text']
          ],
          "3AM": [
            jsonDataHour[3]['temp_c'],
            jsonDataHour[3]['condition']['text']
          ],
          "4AM": [
            jsonDataHour[4]['temp_c'],
            jsonDataHour[4]['condition']['text']
          ],
          "5AM": [
            jsonDataHour[5]['temp_c'],
            jsonDataHour[5]['condition']['text']
          ],
          "6AM": [
            jsonDataHour[6]['temp_c'],
            jsonDataHour[6]['condition']['text']
          ],
          "7AM": [
            jsonDataHour[7]['temp_c'],
            jsonDataHour[7]['condition']['text']
          ],
          "8AM": [
            jsonDataHour[8]['temp_c'],
            jsonDataHour[8]['condition']['text']
          ],
          "9AM": [
            jsonDataHour[9]['temp_c'],
            jsonDataHour[9]['condition']['text']
          ],
          "10AM": [
            jsonDataHour[10]['temp_c'],
            jsonDataHour[10]['condition']['text']
          ],
          "11AM": [
            jsonDataHour[11]['temp_c'],
            jsonDataHour[11]['condition']['text']
          ],
          "12PM": [
            jsonDataHour[12]['temp_c'],
            jsonDataHour[12]['condition']['text']
          ],
          "1PM": [
            jsonDataHour[13]['temp_c'],
            jsonDataHour[13]['condition']['text']
          ],
          "2PM": [
            jsonDataHour[14]['temp_c'],
            jsonDataHour[14]['condition']['text']
          ],
          "3PM": [
            jsonDataHour[15]['temp_c'],
            jsonDataHour[15]['condition']['text']
          ],
          "4PM": [
            jsonDataHour[16]['temp_c'],
            jsonDataHour[16]['condition']['text']
          ],
          "5PM": [
            jsonDataHour[17]['temp_c'],
            jsonDataHour[17]['condition']['text']
          ],
          "6PM": [
            jsonDataHour[18]['temp_c'],
            jsonDataHour[18]['condition']['text']
          ],
          "7PM": [
            jsonDataHour[19]['temp_c'],
            jsonDataHour[19]['condition']['text']
          ],
          "8PM": [
            jsonDataHour[20]['temp_c'],
            jsonDataHour[20]['condition']['text']
          ],
          "9PM": [
            jsonDataHour[21]['temp_c'],
            jsonDataHour[21]['condition']['text']
          ],
          "10PM": [
            jsonDataHour[22]['temp_c'],
            jsonDataHour[22]['condition']['text']
          ],
          "11PM": [
            jsonDataHour[23]['temp_c'],
            jsonDataHour[23]['condition']['text']
          ],
        });
  }













  MaterialColor getThemeColor() {
    if (weatherStateName == "Clear"||weatherStateName=="Cloudy" || weatherStateName == "Light Cloud") {
      return Colors.blue;
    } 
    
    else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return Colors.grey;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == "Thunder") {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    }
   
    else if (weatherStateName == "Light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Showers" ||
        weatherStateName!.contains("rain")) {
      return Colors.blue;
    } else {
      return Colors.lightBlue;
    }
  }
}

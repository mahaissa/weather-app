import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherDecoration {
  var date = DateTime.now();

  BoxDecoration getWeatherDecoration(WeatherModel weatherData) {
    DateFormat inputFormat = DateFormat('hh:mm a');
    DateTime sunrise = inputFormat.parse(weatherData.sunrise!);
    DateTime sunset = inputFormat.parse(weatherData.sunset!);

    if (date.isAfter(sunrise) && date.isBefore(sunset)) {
      return BoxDecoration(
          gradient: LinearGradient(colors: [
        weatherData.getThemeColor(),
        weatherData.getThemeColor()[600]!,
        weatherData.getThemeColor()[100]!
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter));
    }

    return BoxDecoration(
        gradient: LinearGradient(colors: [
      weatherData.getThemeColor(),
      weatherData.getThemeColor()[800]!,
      weatherData.getThemeColor()[900]!
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter));
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class SearchProvider extends ChangeNotifier {
  WeatherModel? _weatherData; //بإضافة الشخطة خليتو برايفت و استخدمت سيتر و جيتر
  //هذا الشي ما رح يأثر لانو بصفحة السيرش عملت اكسيس للسيتر تماما مثل المتغير
  String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}

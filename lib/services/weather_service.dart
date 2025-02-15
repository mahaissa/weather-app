// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "a640d049f66f407faa732953241108";
  late LocationPermission permission;

  Future<WeatherModel?> search({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url =
          Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");

      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJason(data);
    } catch (e) {
      print("nooooo data");
    }
    return weather;
  }

  Future<String> getCurrentCity() async {
    //get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //fetch the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    //convert the location into a list of placemarkobject
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //exact the city name from the placemark object

    String? city = placemark[0].administrativeArea;
    return city ?? "";
  }
}

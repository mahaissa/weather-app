import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class GetWidgets {
  String getImage(String weatherStateName) {
    if (weatherStateName == "Light Cloud" || weatherStateName == "Sunny") {
      return "assets/images/sunny.png";
    } else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return "assets/images/snow.png";
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == "Thunder") {
      return "assets/images/thunderstorm.png";
    } else if (weatherStateName == 'Heavy Cloud') {
      return "assets/images/cloudy.png";
    } else if (weatherStateName == "Partly cloudy") {
      return "assets/images/part_cloudy.png";
    } else if (weatherStateName == "clear") {
      return "assets/images/clear.png";
    } else if (weatherStateName == "Light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Showers" ||
        weatherStateName.contains("rain")) {
      return "assets/images/rainy.png";
    } else {
      return "assets/images/clear.png";
    }
  }

  sun(WeatherModel weatherModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            )),
        width: 250,
        height: 150,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: 50,
                    child: Image.asset(
                      "assets/images/sunrise.png",
                      fit: BoxFit.cover,
                    )),
                const Text(
                  "Sunrise",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${weatherModel.sunrise}")
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    "assets/images/sunset.png",
                    fit: BoxFit.cover,
                  )),
              const Text(
                "Sunset",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("${weatherModel.sunset}")
            ],
          )
        ]),
      ),
    );
  }

  hummidity(WeatherModel weatherModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            )),
        width: 350,
        height: 150,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: 50,
                    child: Image.asset(
                      "assets/images/pressure.png",
                      fit: BoxFit.cover,
                    )),
                const Text(
                  "Pressure",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${weatherModel.pressureMb}")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: 50,
                    child: Image.asset(
                      "assets/images/humidity.png",
                      fit: BoxFit.cover,
                    )),
                const Text(
                  "Humidity",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${weatherModel.humidity}")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 60,
                    width: 50,
                    child: Image.asset(
                      "assets/images/wind.png",
                      fit: BoxFit.cover,
                    )),
                const Text(
                  "Wind Kph",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${weatherModel.windKph}")
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

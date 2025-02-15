// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/get_widgets.dart';

// ignore: must_be_immutable
class HourWeather {
  GetWidgets getImage = GetWidgets();
  Widget buildHourWeather(WeatherModel weatherData) {
    final children = <Widget>[];
    weatherData.hours.forEach(
      (key, value) {
        children.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 80,
            height: 200,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 232, 233, 238),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$key",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          getImage.getImage("${value[1]}"),
                          fit: BoxFit.cover,
                        ))),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "${value[0]}\u00B0",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
      },
    );
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 120,
        child: ListView(scrollDirection: Axis.horizontal, children: children));
  }
}

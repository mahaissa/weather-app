// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/city_search_page.dart';
import 'package:weather_app/provider/search_provider.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;
  String? homeName;
  double? temp;
  SearchPage( {super.key, required this.homeName,required this.temp});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // ignore:
        appBar: AppBar(title: Text("Search a city")),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              "Weather",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
                onChanged: (value) {
                  cityName = value;
                },
                onSubmitted: (value) async {
                  cityName = value;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                              create: (_) => SearchProvider(),
                              child: CitySearch(
                                cityName: cityName,
                              ),
                            )),
                  );
                },
                decoration: InputDecoration(
                  label: const Text("search"),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  suffixIcon: GestureDetector(
                      child: const Icon(Icons.search),
                      onTap: () async {
                        
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                              create: (_) => SearchProvider(),
                              child: CitySearch(
                                cityName: cityName,
                              ),
                            )),
                  );
                      }),
                  border: const OutlineInputBorder(),
                  hintText: "Enter the city",
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("SUGGESTED :"),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    )),
                width: 350,
                height: 75,
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,       
          mainAxisAlignment: MainAxisAlignment.spaceBetween,         
                  children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "Your Home :",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Icon(
                                Icons.location_city,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: "   $homeName : ${ temp!.toInt()} \u2103",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
      ),

             
                ]),
              ),
            ),
          )
        ]));
  }
}

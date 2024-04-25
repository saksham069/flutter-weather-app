import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/current_weather.dart';
import 'package:weather_app/hourly_weather.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? tempC;
  String? pressureMb;
  String? humidity;
  String? windKph;
  List hourlyForecast = List.filled(5, null);

  @override
  void initState() {
    super.initState();
    getForecast();
  }

  Future<void> getForecast() async {
    final res = await http.get(Uri.parse(
        "http://api.weatherapi.com/v1/forecast.json?key=8f8ec4812ea94a4e950170705242504&q=London&days=1&aqi=no&alerts=no"));
    final json = await jsonDecode(res.body);
    tempC = json["current"]["temp_c"].toString();
    pressureMb = json["current"]["pressure_mb"].toString();
    humidity = json["current"]["humidity"].toString();
    windKph = json["current"]["wind_kph"].toString();
    hourlyForecast = json["forecast"]["forecastday"][0]["hour"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: getForecast,
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(size: 30, Icons.refresh_rounded),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrentWeather(
                tempC: tempC,
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyWeather(
                      time:
                          hourlyForecast[0]?["time"]?.toString().split(" ")[1],
                      tempC: hourlyForecast[0]?["temp_c"]?.toString(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    HourlyWeather(
                      time:
                          hourlyForecast[1]?["time"]?.toString().split(" ")[1],
                      tempC: hourlyForecast[1]?["temp_c"]?.toString(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    HourlyWeather(
                      time:
                          hourlyForecast[2]?["time"]?.toString().split(" ")[1],
                      tempC: hourlyForecast[2]?["temp_c"]?.toString(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    HourlyWeather(
                      time:
                          hourlyForecast[3]?["time"]?.toString().split(" ")[1],
                      tempC: hourlyForecast[3]?["temp_c"]?.toString(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    HourlyWeather(
                      time:
                          hourlyForecast[4]?["time"]?.toString().split(" ")[1],
                      tempC: hourlyForecast[4]?["temp_c"]?.toString(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          size: 40,
                          Icons.water_drop,
                        ),
                        const Text("Humidity",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(humidity ?? ""),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          size: 40,
                          Icons.air,
                        ),
                        const Text("Wind Speed",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(windKph ?? ""),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          size: 40,
                          Icons.beach_access,
                        ),
                        const Text("Pressure",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(pressureMb ?? ""),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

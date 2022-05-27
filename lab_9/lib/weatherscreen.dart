import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class Weather extends StatefulWidget {
  const Weather(this.position);
  final position;
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  dynamic position;
  String city = '';
  String temp = '';
  String icon = '';
  @override
  initState() {
    super.initState();
    setState(() {
      position = widget.position;
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (kDebugMode) {
      print(position);
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  getWeather() async {
    const apiKey = '73df7cf08631ee90566069f33dea4d2a';
    http.Response response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position!.latitude.toString()}&lon=${position!.longitude.toString()}&appid=$apiKey',
      ),
    );
    print(response.body);
    var data = jsonDecode(response.body);
    icon = getWeatherIcon(data['weather'][0]['id']);
    temp = data['main']['temp'].toString();
    city = data['name'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  '$position',
                ),
              ),
              Center(
                child: Text(
                  'City: $city',
                ),
              ),
              Center(
                child: Text(
                  'Temprature: $temp',
                ),
              ),
              Center(
                child: Text(
                  'Climate: $icon',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    getLocation();
                    getWeather();
                  });
                },
                child: const SizedBox(
                  width: 200,
                  child: FittedBox(
                    child: Text(
                      'Get Weather Updates',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

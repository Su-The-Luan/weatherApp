import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/page/home/widgets/home_detail.dart';

import 'package:weather_app/page/home/widgets/home_location.dart';
import 'package:weather_app/page/home/widgets/home_temperature.dart';

import 'package:weather_app/page/home/widgets/home_weather_icon.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff1d6cf3),
                Color(0xff19D2fe),
              ],
            ),
          ),
          child: FutureBuilder(
            future: context.read<WeatherProvider>().getWeatherCurrent(),
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Container(
                  child: const Text('no data'),
                );
              }

              WeatherData data = snapshot.data as WeatherData;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeWeatherIcon(
                    nameIcon: data.weather[0].main,
                  ),
                  HomeTemperature(
                    temp: data.main.temp,
                  ),
                  HomeLocation(
                    location: data.name,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  HomeDetail(
                    speedWind: data.wind.speed,
                    humidity: data.main.humidity,
                  ),
                ],
              );
            },
          )),
    );
  }
}

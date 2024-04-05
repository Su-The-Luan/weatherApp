import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repository/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Position? position;
  String nameCity = "HCM";
  updatePosition(Position positionCurrent) {
    position = positionCurrent;
    notifyListeners();
  }

  Future<WeatherData> getWeatherCurrent() async {
    WeatherData result = await ApiRepository.callApIGetWeather(position);
    nameCity = result.name;
    notifyListeners();

    return result;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> result =
        await ApiRepository.callApIGetWeatherDetail(position);
    return result;
  }
}

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> callApIGetWeather(Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${Mykey.api_token}',
      );
      final data = res.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<List<WeatherDetail>> callApIGetWeatherDetail(
      Position? position) async {
    try {
      final dio = Dio();
      final res = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${position?.latitude}&lon=${position?.longitude}&units=metric&appid=${Mykey.api_token}',
      );
      final data = res.data['list'];
      List<WeatherDetail> result =
          List.from(data.map((e) => WeatherDetail.fromMap(e)).toList());
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

import 'dart:math';

import 'package:weather_bloc/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
  Future<Weather> fetchDetailWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  double cachedTempCelsius;
  @override
  Future<Weather> fetchDetailWeather(String cityName) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        if (random.nextBool()) {
          // throw NetworkError();
        }

        cachedTempCelsius = 20 + random.nextInt(15) + random.nextDouble();

        return Weather(
            cityName: cityName, temperatureCelsius: cachedTempCelsius);
      },
    );
  }

  @override
  Future<Weather> fetchWeather(String cityName) {
    // TODO: implement fetchWeather
    return null;
  }
}

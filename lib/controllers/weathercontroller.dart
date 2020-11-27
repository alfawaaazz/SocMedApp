import 'package:SocMedApp/models/weather.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';

class WeatherController extends GetxController {
  final wf = WeatherModel().obs;
  WeatherFactory weather;

  String apiKey = '53862ec8ca1bbd0799c36df21326f30f';

  void getWeather(double lat, double lon) async {
    weather = new WeatherFactory(apiKey);
    Weather w = await weather.currentWeatherByLocation(lat, lon);
    print("Area name: ${w.areaName}");
    print("Weather: ${w.weatherMain}");
    print("Pressure: ${w.pressure}");
  }
}

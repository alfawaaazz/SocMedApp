import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/positioncontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/models/position.dart';
import 'package:SocMedApp/models/weather.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';

class WeatherController extends GetxController {
  final wf = WeatherModel().obs;
  final pos = PositionModel().obs;
  Position position;
  WeatherFactory weather;

  String apiKey = '53862ec8ca1bbd0799c36df21326f30f';

  void getWeather(double lat, double lon) async {
    weather = new WeatherFactory(apiKey);
    Weather w = await weather.currentWeatherByLocation(lat, lon);
    print("Area name: ${w.areaName}");
    print("Weather: ${w.weatherMain}");
    print("Pressure: ${w.pressure}");

    wf.update((val) {
      val.areaName = w.areaName;
      val.country = w.country;
      val.pressure = w.pressure;
      val.sunrise = w.sunrise;
      val.sunset = w.sunset;
      val.tempCels = w.temperature.celsius;
      val.tempMax = w.tempMax.celsius;
      val.tempMin = w.tempMin.celsius;
      val.tempFeelsLike = w.tempFeelsLike.celsius;
      val.weather = w.weatherMain;
      val.weatherDesc = w.weatherDescription;
    });
  }

  void getPosition() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print("position.latitude: ${position.latitude}");
    print("position.longiotude: ${position.longitude}");

    pos.update((val) {
      val.lat = position.latitude;
      val.lon = position.longitude;
    });

    print("Latitude: ${pos.value.lat}");
    print("Longitude: ${pos.value.lon}");
  }
}

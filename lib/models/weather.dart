class WeatherModel {
  String areaName;
  String country;
  double pressure;

  DateTime sunrise;
  DateTime sunset;

  double tempCels;
  double tempFar;

  String weather;
  String weatherDesc;
  double tempMax;
  double tempMin;
  double tempFeelsLike;

  WeatherModel({
    this.areaName,
    this.country,
    this.pressure,
    this.sunrise,
    this.sunset,
    this.tempCels,
    this.tempFar,
    this.weather,
    this.weatherDesc,
    this.tempMax,
    this.tempMin,
    this.tempFeelsLike,
  });
}

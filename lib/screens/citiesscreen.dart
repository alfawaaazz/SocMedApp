import 'package:SocMedApp/controllers/weathercontroller.dart';
import 'package:SocMedApp/widgets/citiestile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitiesScreen extends GetWidget<WeatherController> {
  final List<String> cities = [
    "Bacolod City",
    "Mandaluyong City",
    "Taguig City",
    "Cebu City",
    "Caloocan City",
    "Davao City",
    "Iloilo City",
    "Quezon City",
    "Dumaguete City",
    "Silay City",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select city"),
        ),
        backgroundColor: Colors.blue,
        body: Container(
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  print("Tile tapped");
                  controller.getWeatherByCityName(cities[index]);
                  Get.back();
                },
                child: CitiesTile(
                  cities[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

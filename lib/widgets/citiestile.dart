import 'package:SocMedApp/controllers/weathercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitiesTile extends GetWidget<WeatherController> {
  final String cityName;
  CitiesTile(this.cityName);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          // top: BorderSide(
          //   color: Colors.white70,
          //   width: 2,
          // ),
          bottom: BorderSide(
            color: Colors.white70,
            width: 2,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        cityName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}

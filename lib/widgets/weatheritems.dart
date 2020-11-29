import 'package:SocMedApp/controllers/weathercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherItems extends StatelessWidget {
  final String title;
  final String desc;

  WeatherItems({this.title, this.desc});

  final WeatherController weatherCont =
      Get.put<WeatherController>(WeatherController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

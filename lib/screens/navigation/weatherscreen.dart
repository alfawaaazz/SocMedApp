import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/positioncontroller.dart';
import 'package:SocMedApp/controllers/startupcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/controllers/weathercontroller.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:SocMedApp/widgets/weatheritems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends GetWidget<AuthController> {
  final UserController userController =
      Get.put<UserController>(UserController());

  final WeatherController weatherCont =
      Get.put<WeatherController>(WeatherController());
  final AuthController authCont = Get.put<AuthController>(AuthController());

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String dayDate = DateFormat.MMMd().format(date);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    // "Hello, ${userController.user.firstName}",
                    //"Hello, ${Get.find<UserController>().fetchFirstName()}",
                    "Hello, ${Get.find<UserController>().user.firstName}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "${weatherCont.wf.value.areaName}, ${weatherCont.wf.value.country}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Today, $dayDate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${weatherCont.wf.value.tempCels.toInt()}\u00B0C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "Feels like ${weatherCont.wf.value.tempFeelsLike.toInt()}\u00B0C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "${weatherCont.wf.value.weather}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "${weatherCont.wf.value.weatherDesc}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: WeatherItems(
                        title: "SUNRISE",
                        desc:
                            "${weatherCont.wf.value.sunrise.hour}:${weatherCont.wf.value.sunrise.minute}",
                      ),
                    ),
                    Container(
                      child: WeatherItems(
                        title: "SUNSET",
                        desc:
                            "${weatherCont.wf.value.sunset.hour}:${weatherCont.wf.value.sunset.minute} ",
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    "Pressure: ${weatherCont.wf.value.pressure} hPa",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

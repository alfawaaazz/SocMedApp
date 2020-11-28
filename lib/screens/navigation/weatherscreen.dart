import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/positioncontroller.dart';
import 'package:SocMedApp/controllers/startupcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/controllers/weathercontroller.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends GetWidget<AuthController> {
  final UserController userController =
      Get.put<UserController>(UserController());

  final WeatherController weatherCont =
      Get.put<WeatherController>(WeatherController());
  final AuthController authCont = Get.put<AuthController>(AuthController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: GetX<UserController>(
                  init: UserController(),
                  initState: (_) async {
                    Get.find<UserController>().user =
                        await Database().getUser(controller.user.uid);
                  },
                  builder: (UserController userCont) {
                    return Text(
                      // "Hello, ${userController.user.firstName}",
                      //"Hello, ${Get.find<UserController>().fetchFirstName()}",
                      "Hello, ${Get.find<UserController>().user.firstName}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: weatherCont.getPosition,
                  child: Text("Get Location"),
                ),
              ),
              Container(
                child: Obx(() => Text(
                      "Latitude: ${weatherCont.pos.value.lat}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              Container(
                child: Obx(() => Text(
                      "Longitude: ${weatherCont.pos.value.lon}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () => weatherCont.getWeather(
                    weatherCont.pos.value.lat,
                    weatherCont.pos.value.lon,
                  ),
                  child: Text("Get Weather"),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "Area Name: ${weatherCont.wf.value.areaName}, ${weatherCont.wf.value.country}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "Pressure: ${weatherCont.wf.value.pressure} hPa",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "Sunrise: ${weatherCont.wf.value.sunrise.hour}:${weatherCont.wf.value.sunrise.minute}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "Sunset: ${weatherCont.wf.value.sunset.hour}:${weatherCont.wf.value.sunset.minute}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "Temperature: ${weatherCont.wf.value.tempCels.toInt()}\u00B0C",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "TempFeelsLike: ${weatherCont.wf.value.tempFeelsLike.toInt()}\u00B0C",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "Weather: ${weatherCont.wf.value.weather}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                child: Obx(
                  () => Text(
                    "Weather Desc: ${weatherCont.wf.value.weatherDesc}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Get.find<StartUpController>().toggleLoadingValue();
                },
                child: Text("Toggle Loading Value"),
              ),
              Container(
                child: Obx(
                  () => Text(
                      "LoadingValue: ${Get.find<StartUpController>().loadingValue.value}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

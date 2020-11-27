import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/positioncontroller.dart';
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
  final PositionController posCont =
      Get.put<PositionController>(PositionController());
  final WeatherController weatherCont =
      Get.put<WeatherController>(WeatherController());
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
                      "Hello, ${userController.user.firstName}",
                      //"Hello, ${Get.find<UserController>().fetchFirstName()}",
                      //"Hello, ${Get.find<UserController>().user.firstName}",
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
                  onPressed: posCont.getPosition,
                  child: Text("Get Location"),
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () => weatherCont.getWeather(
                    posCont.pos.value.lat,
                    posCont.pos.value.lon,
                  ),
                  child: Text("Get Weather"),
                ),
              ),
              Container(
                child: Obx(() => Text(
                      "Latitude: ${posCont.pos.value.lat}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              Container(
                child: Obx(() => Text(
                      "Longitude: ${posCont.pos.value.lon}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

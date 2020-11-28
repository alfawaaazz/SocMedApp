import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/bottomnavigationcontroller.dart';
import 'package:SocMedApp/controllers/positioncontroller.dart';
import 'package:SocMedApp/controllers/startupcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/controllers/weathercontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());

    Get.lazyPut(() => UserController());
    //Get.lazyPut(() => PositionController());

    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => StartUpController());
  }
}

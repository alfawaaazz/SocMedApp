import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());

    Get.lazyPut(() => UserController());
  }
}

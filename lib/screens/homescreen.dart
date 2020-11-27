import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/screens/loadingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: controller.loading
            ? LoadingScreen()
            : Center(
                child: RaisedButton(
                  onPressed: controller.signOut,
                  child: Text("Sign Out"),
                ),
              ),
      ),
    );
  }
}

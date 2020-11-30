import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleHome extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Sign In with Google"),
              onPressed: () async {
                controller.signInWithGoogle();
              },
            ),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

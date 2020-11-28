import 'package:SocMedApp/controllers/authcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final UserController userCont = Get.put<UserController>(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            child: CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: Image.asset(
                  "assets/${Get.find<UserController>().user.firstName}.jpg",
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "${userCont.user.firstName} ${userCont.user.lastName}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: RaisedButton(
              onPressed: Get.find<AuthController>().signOut,
              child: Text("Sign Out"),
            ),
          ),
        ],
      ),
    );
  }
}

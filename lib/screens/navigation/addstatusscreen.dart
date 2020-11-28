import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/screens/homescreen.dart';
import 'package:SocMedApp/screens/navigation/newsfeedscreen.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStatusScreen extends StatelessWidget {
  final TextEditingController statusCont = TextEditingController();
  final UserController userCont = Get.put<UserController>(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Status"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //submit status here
          // Database().addNewsFeedItem(
          //   userCont.user.id,
          //   userCont.user.firstName,
          //   userCont.user.lastName,
          //   statusCont.text,
          // );
          if (statusCont.text == "") {
            Get.snackbar("Write something", "Status is empty",
                snackPosition: SnackPosition.BOTTOM);
          } else {
            Get.offAll(HomeScreen());
            print("UID: ${userCont.user.id}");
            print("FirstName: ${userCont.user.firstName}");
            print("LastName: ${userCont.user.lastName}");
            print("Status: ${statusCont.text}");
            print(statusCont.text);
            Database().addNewsFeedItem(
              userCont.user.id,
              userCont.user.firstName,
              userCont.user.lastName,
              statusCont.text,
            );
          }
        },
        label: Text("Submit"),
      ),
      body: Column(
        children: [
          Container(
            child: TextFormField(
              controller: statusCont,
              decoration: InputDecoration(
                hintText: "What's on your mind? ",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

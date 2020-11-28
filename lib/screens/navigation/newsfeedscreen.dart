import 'package:SocMedApp/controllers/newsfeedcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/screens/navigation/addstatusscreen.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:SocMedApp/widgets/statustile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewsFeedScreen extends StatelessWidget {
  final NewsFeedController newsFeedCont =
      Get.put<NewsFeedController>(NewsFeedController());
  final UserController userController =
      Get.put<UserController>(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.to(AddStatusScreen());
        },
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "ConnectR",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: newsFeedCont.newsFeed.length,
          itemBuilder: (_, index) {
            DateTime date = DateTime.fromMillisecondsSinceEpoch(
                newsFeedCont.newsFeed[index].timestamp.millisecondsSinceEpoch);
            String dayDate = DateFormat.MMMEd().format(date);
            String dayTime = DateFormat.Hm().format(date);

            return StatusTile(
              index: index,
              dayTime: dayTime,
            );
          },
        ),
      ),
    );
  }
}

import 'package:SocMedApp/controllers/newsfeedcontroller.dart';
import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/screens/navigation/addstatusscreen.dart';
import 'package:SocMedApp/services/database.dart';
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

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.white54,
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: Colors.white54,
                    width: 1,
                  ),
                ),
              ),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      "assets/${newsFeedCont.newsFeed[index].firstName}.jpg",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  "${newsFeedCont.newsFeed[index].firstName} ${newsFeedCont.newsFeed[index].lastName}  ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              //Text("${newsFeedCont.newsFeed[index].lastName}"),
                              // Text(
                              //   "${newsFeedCont.newsFeed[index].timestamp.millisecondsSinceEpoch}"),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Database().deleteNewsFeedItem(
                                      newsFeedCont.newsFeed[index].newsFeedId);
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Text(dayDate),
                        Container(
                          padding: EdgeInsets.only(top: 3),
                          child: Text(
                            dayTime,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: 250,
                          //color: Colors.green,
                          child: Wrap(
                            children: [
                              Text(
                                newsFeedCont.newsFeed[index].content,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                //textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Likes ${newsFeedCont.newsFeed[index].likes}   Comments ${newsFeedCont.newsFeed[index].comments}",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

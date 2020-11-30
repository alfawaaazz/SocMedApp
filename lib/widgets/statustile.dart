import 'package:SocMedApp/controllers/newsfeedcontroller.dart';
import 'package:SocMedApp/controllers/newsfeedlikedcontroller.dart';
import 'package:SocMedApp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusTile extends StatelessWidget {
  final int index;
  final String dayTime;
  final String dayDate;
  StatusTile({this.index, this.dayTime, this.dayDate});
  final NewsFeedController newsFeedCont =
      Get.put<NewsFeedController>(NewsFeedController());
  final NewsFeedLikedController newsFeedLikedCont =
      Get.put<NewsFeedLikedController>(NewsFeedLikedController());
  @override
  Widget build(BuildContext context) {
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
            child: ClipOval(
              child: Image.asset(
                "assets/${newsFeedCont.newsFeed[index].firstName}.jpg",
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
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
                    "$dayTime | $dayDate",
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
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Database().likePress(
                          //   newsFeedCont.newsFeed[index].newsFeedId,
                          // );
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white70,
                          size: 20,
                        ),
                        // : Icon(
                        //     Icons.favorite,
                        //     color: Colors.red,
                        //     size: 20,
                        //   ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 20),
                        child: Text(
                          "${newsFeedCont.newsFeed[index].likes}",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.comment_rounded,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "${newsFeedCont.newsFeed[index].comments}",
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
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class NewsFeedModel {
  String newsFeedId;
  String imgAsset;
  String firstName;
  String lastName;
  String content;
  int comments;
  int likes;
  bool isLiked;
  Timestamp timestamp;

  NewsFeedModel({
    this.newsFeedId,
    this.imgAsset,
    this.firstName,
    this.lastName,
    this.content,
    this.comments,
    this.isLiked,
    this.likes,
    this.timestamp,
  });

  NewsFeedModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    newsFeedId = doc.id;
    //imgAsset = doc.get("imgAsset");
    firstName = doc.get("firstName");
    lastName = doc.get("lastName");
    content = doc.get("content");
    comments = doc.get("comments");
    likes = doc.get("likes");
    timestamp = doc.get("dateCreated");
    // isLiked = doc.get("isLiked");
  }
}

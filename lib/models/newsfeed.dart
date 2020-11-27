import 'package:cloud_firestore/cloud_firestore.dart';

class NewsFeedModel {
  String imgAsset;
  String firstName;
  String lastName;
  String content;
  int comments;
  int likes;
  bool isLiked;

  NewsFeedModel({
    this.imgAsset,
    this.firstName,
    this.lastName,
    this.content,
    this.comments,
    this.isLiked,
    this.likes,
  });

  NewsFeedModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    imgAsset = doc.get("imgAsset");
    firstName = doc.get("firstName");
    lastName = doc.get("lastName");
    content = doc.get("content");
    comments = doc.get("comments");
    likes = doc.get("likes");
    isLiked = doc.get("isLiked");
  }
}

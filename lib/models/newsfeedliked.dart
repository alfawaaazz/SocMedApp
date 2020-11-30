import 'package:cloud_firestore/cloud_firestore.dart';

class NewsFeedLiked {
  String newsFeedId;

  NewsFeedLiked({this.newsFeedId});

  NewsFeedLiked.fromDocumentSnapshot(DocumentSnapshot doc) {
    newsFeedId = doc.get("newsFeedItemId");
  }
}

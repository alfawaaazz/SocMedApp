import 'package:SocMedApp/models/newsfeed.dart';
import 'package:SocMedApp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createnewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "firstName": user.firstName,
        "lastName": user.lastName,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addNewsFeedItem(
      String uid, String firstName, String lastName, String content) async {
    try {
      await _firestore.collection("newsFeedItems").add({
        "dateCreated": Timestamp.now(),
        "content": content,
        "firstName": firstName,
        "lastName": lastName,
        "comments": 0,
        "likes": 0,
      });
    } catch (e) {}
  }

  Stream<List<NewsFeedModel>> newsFeedStream() {
    return _firestore
        .collection("newsFeedItems")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<NewsFeedModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(NewsFeedModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}

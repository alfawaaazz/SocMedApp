import 'package:SocMedApp/controllers/usercontroller.dart';
import 'package:SocMedApp/models/newsfeed.dart';
import 'package:SocMedApp/models/newsfeedliked.dart';
import 'package:SocMedApp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<void> deleteNewsFeedItem(String newsFeedItemId) async {
    try {
      await _firestore.collection("newsFeedItems").doc(newsFeedItemId).delete();
      Get.snackbar("Item Deleted", "", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {}
  }

  Future<void> likePress(
    String newsFeedItemId,
  ) async {
    String uid = Get.find<UserController>().user.id;
    String firstName = Get.find<UserController>().user.firstName;
    String lastName = Get.find<UserController>().user.lastName;
    try {
      await _firestore
          .collection("newsFeedItems")
          .doc(newsFeedItemId)
          .collection("likers")
          .add({
        "firstName": firstName,
        "lastName": lastName,
      });

      await _firestore
          .collection("users")
          .doc(uid)
          .collection("likedItems")
          .add({
        "newsFeedItemId": newsFeedItemId,
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

  Stream<List<NewsFeedLiked>> newsFeedItemIdStream() {
    return _firestore
        .collection("users")
        .doc(Get.find<UserController>().user.id)
        .collection("likedItems")
        .snapshots()
        .map((QuerySnapshot query) {
      List<NewsFeedLiked> newsFeedStream = List();
      query.docs.forEach((element) {
        newsFeedStream.add(NewsFeedLiked.fromDocumentSnapshot(element));
      });
      return newsFeedStream;
    });
  }
}

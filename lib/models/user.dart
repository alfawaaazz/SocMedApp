import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;

  UserModel({this.id, this.firstName, this.lastName, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id;
    firstName = doc.get("firstName");
    lastName = doc.get("lastName");
    email = doc.get("email");
  }
}

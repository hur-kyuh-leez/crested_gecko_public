import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  String email;
  String uid;
  String phone_number;

  User({
    required this.username,
    required this.email,
    required this.uid,
    required this.phone_number,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "uid": uid,
        "phone_number": phone_number,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      username: snapshot['username'],
      phone_number: snapshot['phone_number'],
    );
  }
}

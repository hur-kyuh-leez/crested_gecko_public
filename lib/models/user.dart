import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  String email;
  String uid;

  User({
    required this.username,
    required this.email,
    required this.uid
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      uid: snapshot['uid'],
      username: snapshot['username'],
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:tiktok_tutorial/controllers/auth_controller.dart';
// import 'package:tiktok_tutorial/views/screens/add_video_screen.dart';



import 'package:crested_gecko/screens/event_screen.dart';
import 'package:crested_gecko/screens/faq_screen.dart';
import 'package:crested_gecko/screens/not_available_screen.dart';
import 'package:flutter/material.dart';

const pages = [
  EventScreen(),
  NotAvailable(),
  Text('Profile Screen'),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// // FIREBASE
// var firebaseAuth = FirebaseAuth.instance;
// var firebaseStorage = FirebaseStorage.instance;
// var firestore = FirebaseFirestore.instance;
//
// // CONTROLLER
// var authController = AuthController.instance;
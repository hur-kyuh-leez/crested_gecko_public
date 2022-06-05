import 'package:crested_gecko/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:crested_gecko/screens/event_screen.dart';
import 'package:crested_gecko/screens/not_available_screen.dart';
import 'package:crested_gecko/screens/profile_screen.dart';

import 'package:flutter/material.dart';

 List<StatelessWidget> pages = [
  EventScreen(),
  NotAvailable(),
  ProfileScreen()
  // Text('Profile Screen'),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;

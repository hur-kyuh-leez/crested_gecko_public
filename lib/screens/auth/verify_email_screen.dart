import 'dart:async';
import 'package:crested_gecko/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:crested_gecko/constants.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // user needs to be created before!
    isEmailVerified = firebaseAuth.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 5),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void disposed() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    // call after email verification!
    await firebaseAuth.currentUser!.reload();
    setState(() {
      isEmailVerified = firebaseAuth.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = firebaseAuth.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      Get.snackbar(
        '문제가 있네요',
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? HomeScreen()
      : Scaffold(
          appBar: AppBar(
            title: Text('이메일을 확인 하세요'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('인증 이메일을 전송 하였습니다. 이메일을 확인 해주세요.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    primary: buttonColor
                    ,
                  ),
                  icon: Icon(Icons.email, size: 32),
                  label: Text('인증 이메일 재전송', style: (TextStyle(fontSize: 24))),
                  onPressed: sendVerificationEmail,
                ),
              ],
            ),
          ));
}

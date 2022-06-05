import 'dart:io';
import 'package:crested_gecko/constants.dart';
import 'package:crested_gecko/screens/auth/verify_email_screen.dart';
import 'package:crested_gecko/screens/home_screen.dart';
import 'package:crested_gecko/models/user.dart' as model;
import 'package:crested_gecko/screens/onboarding_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user; // late Rx<User?> _user;

  // 이 형태는 뭘까? 그냥 getter 만드는 걸 까? 맞음 변수를 define 할 때 기본으로 하는 boilerplate 임
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user,
        _setInitialScreen); // if _user changes ever,  call _setInitialScreen()
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => OnBoardingScreen());
    } else {
      // Get.offAll(() => const HomeScreen()
          Get.offAll(() => VerifyEmailScreen()
      );
    }
  }

  // registering the user
  void registerUser(String username, String email, String password, String phone_number) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        if (email.contains('@naver.com')){
          // save out user to our ath and firebase firestore
          UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          model.User user = model.User(
            username: username,
            email: email,
            uid: cred.user!.uid, // user.uid를 활용해서  파일 uid로 씀
            phone_number: phone_number,

          );
          await firestore
              .collection('users')
              .doc(cred.user!.uid)
              .set(user.toJson()); // store in firestore
        } else {
          Get.snackbar(
            '네이버 이메일이 아닙니다',
            '파사모에 가입한 이메일로 가입 해주시길 바랍니다',
          );
        }

      }
      else {
        Get.snackbar(
          '문제가 있네요',
          '모든 정보를 기입하지 않으셨습니다',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password'){
        Get.snackbar(
          '비밀번호가 너무 짧아요',
          '6자리 이상으로 해주세요',
        );
    } else {
        Get.snackbar(
          '문제가 있네요',
          e.message.toString(),
        );
      }
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          '문제가 있네요',
          '모든 정보를 기입하지 않으셨습니다',
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
        Get.snackbar(
          '이메일 문제',
          '이메일 형식이 틀립니다',
        );
      }
      else if(e.code == 'user-not-found' || e.code == 'wrong-password') {
        Get.snackbar(
          '미가입 또는 비밀번호 문제',
          '회원가입 하셨나요?\n회원이시라면 비밀번호 다시 한번 확인 부탁드립니다',
        );
      }
      else if(e.code == 'too-many-requests') {
        Get.snackbar(
          '로그인 시도 초과',
          '다음에 다시 시도 하시길 바랍니다',
        );
      }
      else {
        Get.snackbar(
          '문제가 있네요',
          e.code.toString(),
        );
      }
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}

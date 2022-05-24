import 'package:crested_gecko/screens/home_screen.dart';
import 'package:crested_gecko/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // firebase initiation
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp().then((value) {
  //   Get.put(AuthController());
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //GetX 활성화
      debugShowCheckedModeBanner: false,
      title: 'Crested Gecko App',
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: backgroundColor,
      // ),
      // home: LoginScreen(),
      // home: HomeScreen(),
      home: OnBoardingScreen(),

    );
  }
}

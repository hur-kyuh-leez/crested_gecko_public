import 'package:crested_gecko/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page we're on
  PageController _controller = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage = false;
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
                onFirstPage = (index == 0); // return true if index is 2
              });
            },
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Lottie.network(
                            'https://assets4.lottiefiles.com/packages/lf20_vvx2gjpt.json'),
                      ),
                      Text(
                        '"크레 조금 더 합리적으로 데려 올 수는 없나?"',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Lottie.network(
                            'https://assets3.lottiefiles.com/private_files/lf30_ZenthI.json'),
                      ),
                      Text(
                        '"중간 유통을 줄이면 될 거 같은데..."',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Lottie.network(
                            'https://assets3.lottiefiles.com/private_files/lf30_ZenthI.json'),
                      ),
                      Text(
                        '"중간 유통을 줄이면 될 거 같은데..."',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // dot indicators, previous, and next
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip
                  onFirstPage
                      ? Text(
                          '뒤로가기',
                          style: TextStyle(color: Colors.black),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            '뒤로가기',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                  // dot indicators
                  SmoothPageIndicator(controller: _controller, count: 3),

                  // next or done
                  onLastPage
                      ? GestureDetector(
                          onTap: () => {Get.to(() => HomeScreen())},
                          child: Text(
                            '모두 동의',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            '다음',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ],
              )),
        ],
      ),
    );
  }
}

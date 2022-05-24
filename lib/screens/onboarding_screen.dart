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
                onLastPage = (index == 6);
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
                            'https://assets6.lottiefiles.com/packages/lf20_4dg6ijc2.json'),
                      ),
                      Text(
                        '"구글링...카페글...카페분들의 조언을 들어보니..."',
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
                        '"중간 유통을 줄이면 될 거 같은데...?!"',
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
                            'https://assets5.lottiefiles.com/packages/lf20_89tq6c8d.json'),
                      ),
                      SizedBox(height: 70),
                      Text(
                        '"직접 해외에서 데려오자!"',
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
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Lottie.network(
                            'https://assets6.lottiefiles.com/packages/lf20_zJSuaQ.json'),
                      ),
                      SizedBox(height: 70),
                      Text(
                        '"방식은 공정하게 래플(응모)!"',
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
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          height: 250,
                          child: Lottie.network(
                              'https://assets7.lottiefiles.com/datafiles/40aX5db74VvGPWw/data.json'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          '(아직 진행하고 있지 않아요! 혼자 계획중입니다!\n'
                          '허락 아직 안받았어요!)\n'
                          '  \n'
                          '참여 자격: \n'
                          '1. 크레와 사랑에 빠지신 분들\n'
                          '2. 파사모 회원 이면서 1개월 이상 활동중 이신 분들!\n'
                          '   \n'
                          '확률 가산점: 도움 주시는 모든 분들!\n',
                          style: TextStyle(
                            height: 2,
                            color: Colors.white,
                          ),
                        ),
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
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: 200,
                          child: Lottie.network(
                              'https://assets4.lottiefiles.com/packages/lf20_buhby0ug.json'),
                        ),
                      ),
                      Text(
                        '이런 건/분 안되요! \n',
                        style: TextStyle(
                            fontSize: 30, height: 1.5, color: Colors.white),
                      ),
                      Text(
                        '1. 중복 응모\n'
                        '2. 되팔이\n'
                        '3. 분쟁 글 있는 회원\n'
                        '4. 고택 (죄송합니다...)\n'
                        '...',
                        style: TextStyle(height: 1.5, color: Colors.white),
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
                  SmoothPageIndicator(controller: _controller, count: 7),

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

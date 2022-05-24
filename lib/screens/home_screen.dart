import 'package:crested_gecko/constants.dart';
import 'package:crested_gecko/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIdx = 0;
 // for bottomNavigationBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int idx) {
            setState(() {
              _pageIdx = idx;
            });
          },
          type: BottomNavigationBarType.fixed, // 이걸 넣어야지 첫번째 이외 labels가 제대로 나온다.
          backgroundColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          currentIndex: _pageIdx,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(),
              label: 'Raffle',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
          ],
        ),
        body: pages[_pageIdx],
        );
  }
}

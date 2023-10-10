import 'package:crested_gecko/screens/faq_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('참여가능 래플 리스트'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            buildImageInteractionCard(),
          ],
        ),
      );
}

Widget buildImageInteractionCard() => InkWell(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: const NetworkImage(
                    'https://images.unsplash.com/photo-1636370395847-e0781efa45e6?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2394',
                  ),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 16,
                  right: 10,

                  // left: 16,
                  child: Text(
                    '크레스티드게코',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,

                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 10,

                  // left: 16,
                  child: Text(
                        '암추 + 숫추 + 미구분\n'
                        '3마리 세트\n',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[400],
                      fontSize: 17,

                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                '50% 보다 높은 확률로\n암컷을 가질수 있는 기회!',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
      // onTap: ()=>{print('hi'),},
      onTap: () => {Get.to(() => const FaqScreen())},
    );

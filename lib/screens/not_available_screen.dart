import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NotAvailable extends StatelessWidget {
  const NotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: const Text('아직 당첨 확인 시간이 아닙니다.'),
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        buildImageInteractionCard('https://images.unsplash.com/photo-1505118380757-91f5f5632de0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1252&q=80', '크레스티드게코 오픈소스\n 블로그', '아이들 사진, 여기서 보실수 있습니다', 'https://blog.naver.com/meta-learning'),
        SizedBox(height: 15),
        buildImageInteractionCard('https://play-lh.googleusercontent.com/cf3DwPLbS8Z55sDvUSTQ6PL1goPdm8KbZ81g4TEUAaeUh5LDhkzdjxKQ2RX6BGpv0x4', '카카오톡 오픈쳇', '자세한 문의는 여기서~\n 비번: 0913', 'https://open.kakao.com/o/gCqXWNie'),

      ],
    ),
  );
}

Widget buildImageInteractionCard(String imageLink, String txt, String subTitle, String link) => InkWell(
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
              image: NetworkImage(
                imageLink,
              ),
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 16,
              right: 10,

              // left: 16,
              child: Text(
                txt,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,

                ),
              ),
            ),
              // left: 16,
          ],
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            subTitle,
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    ),
  ),
  onTap: () async {
    final url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url,mode: LaunchMode.inAppWebView);
    }
  },

);

import 'package:crested_gecko/constants.dart';
import 'package:crested_gecko/data/faq_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('FAQ'),
        ),
        body: Column(
          children: [
            Expanded(child: buildListView()),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: InkWell(
                onTap: () => {
                  // 추천 실제로 되는 로직


                  // 추첨 확인란 보여주기
                  Get.dialog(
                    Dialog(
                      child: Container(
                        height: 100,
                        child: Center(
                          child: Text('버튼테스트 완료!\n베타기간에는 카톡에서 뽑기로 할 예정 입니다.'),
                        ),
                      ),
                    ),
                  )
                },
                child: const Center(
                  child: Text(
                    '래플에 참여하기',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      );
}

Widget buildListView() => Padding(
      padding: EdgeInsets.only(top: 10, left: 20.0, right: 6.0, bottom: 0),
      child: ListView.builder(
          // ListView 무한으로 리스트 생성
          shrinkWrap: true,
          itemCount: faq_data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ExpansionTile(
                textColor: Colors.red[400],
                iconColor: Colors.red[400],
                title: Text(
                  faq_data[index]['question'].toString(),
                  style: TextStyle(fontSize: 25),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      faq_data[index]['answer'].toString(),
                      style: TextStyle(height: 1.75, fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          }),
    );

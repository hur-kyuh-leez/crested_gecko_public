import 'package:crested_gecko/data/faq_data.dart';
import 'package:flutter/material.dart';


class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.black,
          title: Text('FAQ'),
        ),
        body:
          buildListView(),

      );
}



Widget buildListView() => Padding(
  padding: EdgeInsets.only(
      top: 10, left: 20.0, right: 6.0, bottom: 0),
  child: ListView.builder(
    // ListView 무한으로 리스트 생성
      shrinkWrap: true,
      itemCount: faq_data.length,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ExpansionTile(
            textColor:Colors.amber,
            iconColor:Colors.amber,
          title: Text(faq_data[index]['question'].toString()),
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(faq_data[index]['answer'].toString(), style: TextStyle(height: 1.5),
                ),
            ),
          ],
        ),
      );
    }
  ),
);




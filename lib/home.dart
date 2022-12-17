import 'package:flutter/material.dart';
import 'package:testapp/page/Form_Validation.dart';
import 'package:testapp/page/chatAppMain.dart';
import 'package:testapp/page/inflearns.dart';
import 'package:testapp/page/listview_data.dart';
import 'package:testapp/page/listview_dialog.dart';
import 'package:testapp/page/onboarding.dart';
import 'package:testapp/page/provider_test.dart';
import 'package:testapp/page/stream_exam.dart';
import 'package:testapp/page/Fluwidgets.dart';

class HomeBuilder extends StatelessWidget {
  HomeBuilder({super.key});

  final List<Widget> pages = const <Widget>[
    Fluwidgets(),
    OnBoardingPage(),
    ListViewPage(),
    ListView_DataMove(),
    FisOrder(),
    LoginSinUpScreen(),
    StreamExam(),
    Inflearns(),
    FormValidation(),
  ];
  final List<String> Texts = const <String>[
    "Widgets",
    "OnBoardingPage",
    "ListView&Dialog",
    "ListView&DataMove",
    "Provider",
    "ChatApp",
    "StreamExam",
    "Inflearns",
    "FormValidation"
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: width * 0.95,
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return InkWell(
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  child: Row(children: [
                    Text(
                      '${index} ${Texts[index].toString()}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pages[index],
                      ));
                });
          }),
          itemCount: pages.length,
        ),
      ),
    );
  }
}

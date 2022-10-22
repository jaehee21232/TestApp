import 'package:flutter/material.dart';
import 'package:testapp/page/onboarding.dart';

class HomeBuilder extends StatelessWidget {
  HomeBuilder({super.key});
  final List<Widget> pages = <Widget>[OnBoardingPage()];
  final List<String> Texts = <String>["OnBoardingPage"];
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

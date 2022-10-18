import 'package:flutter/material.dart';
import 'package:testapp/page/HelloWorld.dart';

class HomeBuilder extends StatelessWidget {
  HomeBuilder({super.key});
  final List<Widget> pages = <Widget>[HelloWorld()];
  final List<String> Texts = <String>["HelloWorld"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          height: 50,
          child: Row(children: [
            Text(
              Texts[index].toString(),
              style: TextStyle,
            )
          ]),
        );
      }),
      itemCount: pages.length,
    );
  }
}

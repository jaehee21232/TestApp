import 'package:flutter/material.dart';

class MyTabController extends StatefulWidget {
  const MyTabController({super.key});

  @override
  State<MyTabController> createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabcontroller"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.add_a_photo),
              text: "Text",
            ),
            Text("Tab1"),
            Text("Tab3")
            //3개 이상 넣기
          ]),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("첫번째 탭")),
            Center(child: Text("두번째 탭")),
            Center(child: Text("세번째 탭"))
          ],
        ),
      ),
    );
  }
}

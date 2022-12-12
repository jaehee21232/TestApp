import 'package:flutter/material.dart';
import 'package:testapp/inflearns/one.dart';

class Inflearns extends StatelessWidget {
  const Inflearns({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      One(),
    ];
    List<String> name = ["중급 - Http통신, 상태관리"];
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("인프런에서 공부한 거",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Align(
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
                          '${index} ${name[index].toString()}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:testapp/page/fine_dust.dart';

class Inflearns extends StatelessWidget {
  const Inflearns({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const FineDustApp(),
    ];
    List<String> name = [
      "미세먼지 앱",
    ];
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("인프런에서 공부한 거",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: width * 0.95,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return InkWell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      height: 50,
                      child: Row(children: [
                        Text(
                          '$index ${name[index].toString()}',
                          style: const TextStyle(
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

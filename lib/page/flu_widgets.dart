import 'package:flutter/material.dart';
import 'package:testapp/widgets/animated_container.dart';
import 'package:testapp/widgets/AnimatedOpacity.dart';
import 'package:testapp/widgets/Drawer.dart';
import 'package:testapp/widgets/orientation_builder.dart';
import 'package:testapp/widgets/snack_bar.dart';
import 'package:testapp/widgets/tab_controller.dart';

class Fluwidgets extends StatelessWidget {
  const Fluwidgets({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      MyAnimatedContainer(),
      MyAnimatedOpacity(),
      MyDrawer(),
      MySnackBar(),
      MyOrientationBuilder(),
      MyTabController()
    ];
    List<String> name = [
      "AnimatedContainer",
      "AnimatedOpacity",
      "Drawer",
      "SnackBar",
      "OrientationBuilder",
      "TabController",
    ];
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("위젯들", style: TextStyle(fontWeight: FontWeight.bold)),
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

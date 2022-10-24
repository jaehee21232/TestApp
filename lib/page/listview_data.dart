import 'package:flutter/material.dart';

import '../model/listviewdata_model.dart';

class listviewdataandpage extends StatefulWidget {
  const listviewdataandpage({Key? key}) : super(key: key);

  @override
  State<listviewdataandpage> createState() => _listviewdataandpageState();
}

class _listviewdataandpageState extends State<listviewdataandpage> {
  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
    'Fox',
    'Kangaroo',
    'Koala',
    'Lion',
    'Tiger'
  ];

  static List<String> animalImagePath = [
    'images/listview2/bear.png',
    'images/listview2/camel.png',
    'images/listview2/deer.png',
    'images/listview2/fox.png',
    'images/listview2/kangaroo.png',
    'images/listview2/koala.png',
    'images/listview2/lion.png',
    'images/listview2/tiger.png'
  ];

  static List<String> animalLocation = [
    'forest and mountain',
    'dessert',
    'forest',
    'snow mountain',
    'Australia',
    'Australia',
    'Africa',
    'Korea'
  ];

  final List<Animal> animalData = List.generate(
      animalLocation.length,
      (index) => Animal(
          animalName[index], animalLocation[index], animalImagePath[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView.builder(
          itemCount: animalData.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                title: Text(animalData[index].name),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(animalData[index].imgPath),
                ),
              ),
            );
          })),
    );
  }
}

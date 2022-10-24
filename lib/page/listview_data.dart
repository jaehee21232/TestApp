import 'package:flutter/material.dart';

import '../model/listviewdata_model.dart';

class ListView_DataMove extends StatefulWidget {
  const ListView_DataMove({super.key});

  @override
  State<ListView_DataMove> createState() => _ListView_DataMoveState();
}

class _ListView_DataMoveState extends State<ListView_DataMove> {
  static List<String> animalName = <String>[
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

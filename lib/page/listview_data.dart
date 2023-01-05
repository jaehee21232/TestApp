import 'package:flutter/material.dart';
import 'package:testapp/page/animal_page.dart';

import '../model/listviewdata_model.dart';

class ListViewDataMove extends StatefulWidget {
  const ListViewDataMove({super.key});

  @override
  State<ListViewDataMove> createState() => _ListViewDataMoveState();
}

class _ListViewDataMoveState extends State<ListViewDataMove> {
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
    'assets/images/listview2/bear.png',
    'assets/images/listview2/camel.png',
    'assets/images/listview2/deer.png',
    'assets/images/listview2/fox.png',
    'assets/images/listview2/kangaroo.png',
    'assets/images/listview2/koala.png',
    'assets/images/listview2/lion.png',
    'assets/images/listview2/tiger.png'
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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AnimalPage(
                        animal: animalData[index],
                      ),
                    ),
                  );
                },
              ),
            );
          })),
    );
  }
}

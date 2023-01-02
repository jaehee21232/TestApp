import 'package:flutter/material.dart';

class MyOrientationBuilder extends StatefulWidget {
  const MyOrientationBuilder({super.key});

  @override
  State<MyOrientationBuilder> createState() => _MyOrientationBuilderState();
}

class _MyOrientationBuilderState extends State<MyOrientationBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OrientationBuilder"),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.landscape ? 5 : 3,
            children: List.generate(
              50,
              (index) {
                return Center(child: Text("Item $index"));
              },
            ),
          );
        },
      ),
    );
  }
}

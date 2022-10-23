import 'package:flutter/material.dart';

class listviewdataandpage extends StatelessWidget {
  const listviewdataandpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: ListView.builder(itemBuilder: itemBuilder),
    );
  }
}

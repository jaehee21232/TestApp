import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Center"),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: Colors.red),
        )));
  }
}

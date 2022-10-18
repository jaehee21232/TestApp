import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "1번",
                style: TextStyle(fontSize: 30),
              ),
              Text("2번", style: TextStyle(fontSize: 30)),
              Text("3번", style: TextStyle(fontSize: 30))
            ],
          ),
        ));
  }
}

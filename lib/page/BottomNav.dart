import 'package:flutter/material.dart';

class BottomNavi extends StatelessWidget {
  const BottomNavi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Text(
              "1",
              style: TextStyle(fontSize: 30),
            ),
            Text("2", style: TextStyle(fontSize: 30))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
        elevation: 5,
        color: Colors.grey,
      ),
    );
  }
}

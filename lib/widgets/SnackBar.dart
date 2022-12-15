import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({super.key});

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBar"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text("This is SnackBar!"),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text("Show SnackBar"),
      )),
    );
  }
}

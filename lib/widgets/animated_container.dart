import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({super.key});

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  double _border = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedContainer"),
      ),
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_border),
          ),
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          width: _width,
          height: _height,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            _border = random.nextInt(30).toDouble();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

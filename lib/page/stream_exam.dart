import 'dart:developer';
import 'package:flutter/material.dart';

class StreamExam extends StatelessWidget {
  const StreamExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final int price = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream builder"),
      ),
      body: StreamBuilder<int>(
        initialData: price,
        stream: addStreamValue(),
        builder: (context, snapshot) /* snapshot은 스트림의 결과물 */ {
          final pricenumber = snapshot.data.toString();
          return Center(
            child: Text(
              pricenumber,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue),
            ),
          );
        },
      ),
    );
  }

  Stream<int> addStreamValue() {
    return Stream<int>.periodic(
      Duration(seconds: 1),
      (count) => price + count,
    );
  }
}

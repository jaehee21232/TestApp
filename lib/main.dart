import 'package:flutter/material.dart';
import 'package:testapp/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '연습',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text("보기용"),
          centerTitle: true,
        ),
        body: HomeBuilder(),
      ),
    );
  }
}

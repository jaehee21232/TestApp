import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FineDustApp extends StatefulWidget {
  const FineDustApp({super.key});

  @override
  State<FineDustApp> createState() => _FineDustAppState();
}

class _FineDustAppState extends State<FineDustApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("현재 위치 미세먼지 농도"),
          Card(
            child: Column(children: [
              Row(
                children: [
                  Text("얼굴사진"),
                  Text("80"),
                  Text("보통"),
                ],
              ),
              Row(
                children: [
                  Text("얼굴사진"),
                  Text("80"),
                  Text("보통"),
                ],
              )
            ]),
          )
        ],
      )),
    );
  }
}

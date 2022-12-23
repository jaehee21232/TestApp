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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("현재 위치 미세먼지 농도"),
          Card(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("얼굴사진"),
                    Text(
                      "80",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      "보통",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [Text("얼굴사진"), Text("11°")],
                    ),
                    Text("습도"),
                    Text("풍속"),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50.0)),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    )),
              )
            ]),
          )
        ],
      )),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp/config/palette.dart';

class RandomNumber extends StatefulWidget {
  const RandomNumber({super.key});

  @override
  State<RandomNumber> createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber> {
  List<int> randomnumber = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RandomNumberColors.primarycolor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "랜덤숫자생성기",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700),
                ),
                IconButton(
                    onPressed: (() {}),
                    icon: Icon(
                      Icons.settings,
                      color: RandomNumberColors.red,
                    ))
              ],
            ),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: randomnumber
                      .asMap()
                      .entries
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.only(bottom: e.key == 2 ? 0 : 16),
                          child: Row(
                            children: e.value
                                .toString()
                                .split("")
                                .map((e) => Image.asset(
                                      "assets/images/inflearns/$e.png",
                                      height: 70,
                                      width: 50,
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                      .toList()),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      final rand = Random();
                      print(rand.nextInt(3));
                      final List<int> newNumbers = [];

                      for (var i = 0; i < 3; i++) {
                        final number = rand.nextInt(1000);
                        newNumbers.add(number);
                      }
                      setState(() {
                        randomnumber = newNumbers;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: RandomNumberColors.red),
                    child: Text("생성하기")))
          ],
        ),
      )),
    );
  }
}

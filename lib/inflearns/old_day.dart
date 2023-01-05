import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OldDay extends StatefulWidget {
  const OldDay({super.key});

  @override
  State<OldDay> createState() => _OldDayState();
}

class _OldDayState extends State<OldDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [_TopPart(), BottomPart()]),
        ),
      ),
    );
  }
}

class _TopPart extends StatefulWidget {
  const _TopPart({super.key});

  @override
  State<_TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<_TopPart> {
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "ANG",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Parisienne",
              fontSize: 60.0,
            ),
          ),
          Column(
            children: [
              Text(
                "내가 태어난 날",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "sunflower",
                  fontSize: 30.0,
                ),
              ),
              Text(
                "${selectedDate.year}.${selectedDate.month}.${selectedDate.day}",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "sunflower",
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          IconButton(
              iconSize: 60.0,
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white,
                        height: 300,
                        child: CupertinoDatePicker(
                          initialDateTime: selectedDate,
                          mode: CupertinoDatePickerMode.date,
                          maximumDate: now,
                          onDateTimeChanged: (value) {
                            setState(() {
                              selectedDate = value;
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.cake,
                color: Colors.red,
              )),
          Text(
            "${now.difference(selectedDate).inDays}일",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "sunflower",
              fontWeight: FontWeight.w700,
              fontSize: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Image.asset(
      "assets/images/inflearns/reversecongaparrot.gif",
      width: double.infinity,
      fit: BoxFit.fitWidth,
    ));
  }
}

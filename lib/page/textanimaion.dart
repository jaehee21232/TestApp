import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TextAni extends StatefulWidget {
  const TextAni({super.key});

  @override
  State<TextAni> createState() => _TextAniState();
}

class _TextAniState extends State<TextAni> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 1),
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 11.0,
            fontFamily: 'Canterbury',
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText('import'),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testapp/config/palette.dart';

class LoginSinUpScreen extends StatefulWidget {
  const LoginSinUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSinUpScreen> createState() => _LoginSinUpScreenState();
}

class _LoginSinUpScreenState extends State<LoginSinUpScreen> {
  bool isSingupScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/chatapp/red.jpg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "Welcome",
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                                text: " to Yummy chat!",
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Singup to continue",
                      style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

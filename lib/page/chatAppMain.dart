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
    Size size = MediaQuery.of(context).size;
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
                      text: TextSpan(
                          text: "Welcome",
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: size.width * 0.05,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                                text: " to Yummy chat!",
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: size.width * 0.05,
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
          Positioned(
            top: 180,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 280,
              width: size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ]),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSingupScreen = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text("LOGIN",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isSingupScreen
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              )),
                          if (!isSingupScreen)
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.orange,
                            )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSingupScreen = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "SIGNUP",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isSingupScreen
                                    ? Palette.textColor1
                                    : Palette.activeColor),
                          ),
                          if (isSingupScreen)
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              height: 2,
                              width: 55,
                              color: Colors.orange,
                            )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Palette.iconColor,
                            ),
                            enabledBorder: Oupt),
                      ),
                    ],
                  )),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

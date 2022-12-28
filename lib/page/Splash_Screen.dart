import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("images/splash/pitiful.gif"),
        CircularProgressIndicator(
          color: Colors.green[300],
        ),
      ]),
    );
  }
}

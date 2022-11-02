import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/model/fish_model.dart';

class FisOrder extends StatelessWidget {
  const FisOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fish Order"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Fish name: ${Provider.of<FishModel>(context).name}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          High()
        ],
      )),
    );
  }
}

class High extends StatelessWidget {
  const High({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SpicyA is located at high place",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        SpicyA()
      ],
    );
  }
}

class SpicyA extends StatelessWidget {
  const SpicyA({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Fish number",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Fish size",
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Middle(),
      ],
    );
  }
}

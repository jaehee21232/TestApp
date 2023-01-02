import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/model/fish_model.dart';

class FisOrder extends StatelessWidget {
  const FisOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fish Order"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Fish name: ${Provider.of<FishModel>(context).name}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          const High()
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
      children: const [
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
          "Fish number: ${Provider.of<FishModel>(context).number}",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Fish size: ${Provider.of<FishModel>(context).size}",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Provider.of<FishModel>(context, listen: false).changenotifier();
            },
            child: const Text("Change fish number"))
      ],
    );
  }
}

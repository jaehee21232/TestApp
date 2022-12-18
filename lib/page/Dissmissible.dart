import 'package:flutter/material.dart';

class SwipeToDismiss extends StatefulWidget {
  const SwipeToDismiss({super.key});

  @override
  State<SwipeToDismiss> createState() => _SwipeToDismissState();
}

class _SwipeToDismissState extends State<SwipeToDismiss> {
  final items = List<String>.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to Dismiss"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            direction: DismissDirection.startToEnd,
            background: Container(color: Colors.green[100]),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            key: Key(item),
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

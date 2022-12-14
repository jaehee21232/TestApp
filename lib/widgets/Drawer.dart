import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("DrawerHeader"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text("Item1"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Item2"),
          ),
          ListTile(
            title: Text("Item3"),
          )
        ],
      )),
      appBar: AppBar(title: Text("Drawer")),
      body: Center(child: Text("Drawer 예제")),
    );
  }
}

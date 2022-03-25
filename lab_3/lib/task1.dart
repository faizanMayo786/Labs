import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mobile App Dev Lab"),
          backgroundColor: Colors.brown,
        ),
        body: const Center(
          child: Text("You have pressed the Button 0 times."),
        ),
        backgroundColor: Colors.blueGrey,
        floatingActionButton: FloatingActionButton(
          onPressed: (() {}),
          tooltip: "Button is not Functional",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

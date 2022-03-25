import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("I am Rick"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Container(
          width: double.infinity,
          child: Image.asset(
            'asset/image/Capture.PNG',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}

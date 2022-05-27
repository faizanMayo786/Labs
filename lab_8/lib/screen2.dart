import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Page-2',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'GotoPage-1',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    ));
  }
}

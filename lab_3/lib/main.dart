import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
              ),
              Text(
                "Ahad Zohaib",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(
                height: 75,
                width: 350,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "+92456788999",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                width: 350,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ahad@gmail.com",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

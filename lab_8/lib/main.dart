import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lab_8/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen1(),
    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Position? position;
  @override
  initState() {
    Future.delayed(Duration(seconds: 0), () async {
      setState(() {});
      position = await _determinePosition();
    });
    super.initState();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied, we cannot request for permission anymore');
    }
    return await Geolocator.getCurrentPosition();
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (kDebugMode) {
      print(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text(
                  '$position',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                  getLocation();
                },
                child: Container(
                  width: 200,
                  child: FittedBox(
                    child: const Text(
                      'GetLocation Current',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen2()));
                },
                child: const Text(
                  'GotoPage-2',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

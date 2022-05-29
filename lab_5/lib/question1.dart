import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final player = AudioPlayer();

  await player.play(UrlSource('assets/note1.wav'),
      mode: PlayerMode.mediaPlayer);
  await player.play(UrlSource('assets/note2.wav'),
      mode: PlayerMode.mediaPlayer);
  await player.play(UrlSource('assets/note3.wav'),
      mode: PlayerMode.mediaPlayer);
  await player.play(UrlSource('assets/note4.wav'),
      mode: PlayerMode.mediaPlayer);
  await player.play(UrlSource('assets/note5.wav'),
      mode: PlayerMode.mediaPlayer);
  await player.play(UrlSource('assets/note6.wav'),
      mode: PlayerMode.mediaPlayer);
  await player.play(UrlSource('assets/note7.wav'),
      mode: PlayerMode.mediaPlayer);

  runApp(const MaterialApp(
    home: const BallPage(),
  ));
}

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int num = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask Me Anything"),
        backgroundColor: const Color.fromARGB(255, 49, 121, 228),
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: FlatButton(
          child: Image.asset("assets/images/ball$num.png"),
          onPressed: () {
            setState(() {
              num = Random().nextInt(4) + 1;
            });
            print("I got Clicked.");
          },
        ),
      ),
    );
  }
}

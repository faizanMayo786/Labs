import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  expandedButton(Colors.yellow, 1),
                  expandedButton(Colors.black, 2),
                  expandedButton(Colors.purple, 3),
                  expandedButton(Colors.cyan, 4),
                  expandedButton(Colors.orange, 5),
                  expandedButton(Colors.red, 6),
                  expandedButton(Colors.lightGreen, 7),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Expanded expandedButton(Color color, int i) {
    return Expanded(
      child: Container(
        height: double.infinity,
        color: color,
        child: TextButton(
          onPressed: () async {
            // AudioCache audioPlayer = AudioCache();
            // await audioPlayer.play('note$i.wav');
            final player = AudioPlayer();
            
            // url.url = 'note$i.wav';
            await player.play(UrlSource('assets/note$i.wav'),
                // mode: PlayerMode.mediaPlayer
                );
          },
          child: const Text(""),
        ),
      ),
    );
  }
}

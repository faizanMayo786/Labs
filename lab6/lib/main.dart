import 'package:flutter/material.dart';
import 'quiz_bank.dart';

void main() {
  runApp(const MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  const MyQuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Theme(
        data: ThemeData(
          splashColor: Colors.yellow,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Quiz'),
            backgroundColor: Colors.deepPurple,
          ),
          body: const SafeArea(
            child:  MyQuiz(),
          ),
        ),
      ),
    );
  }
}

class MyQuiz extends StatefulWidget {
  const MyQuiz({Key? key}) : super(key: key);

  @override
  _MyQuizState createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  QuizBrain obj = QuizBrain();
  List<Widget> scorkeeper = [];

  void compareAnswer(bool answer) {
    bool corretAnswer = obj.correctAnswer();
    if (obj.isFinished() != true) {
      verifyAnswer(corretAnswer, answer);
    } else {
      verifyAnswer(corretAnswer, answer);

      obj.reset();
      scorkeeper = [];
    }
  }

  void verifyAnswer(bool corretAnswer, bool answer) {
    if (corretAnswer == answer) {
      scorkeeper.add(
        const Icon(Icons.check, color: Colors.green),
      );
    } else {
      scorkeeper.add(
        const Icon(Icons.close, color: Colors.red),
      );
    }
    setState(() {
      obj.nextQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              obj.getQuestions(),
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 75,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                compareAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.deepPurple,
            ),
          ),
        ),
        SizedBox(
          height: 75,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              shape: const StadiumBorder(),
              color: Colors.deepPurple,
              onPressed: () {
                compareAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: scorkeeper,
        )
      ],
    );
  }
}

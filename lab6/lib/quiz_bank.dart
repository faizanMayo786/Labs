import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List _questionBank = [
    Questions('Question 1', false),
    Questions('Question 2', true),
    Questions('Question 3', false),
    Questions('Question 4', true),
    Questions('Question 5', true),
    Questions('Question 6', false),
    Questions('Question 7', true),
    Questions('Question 8', false),
    Questions('Question 9', true),
    Questions('Question 10', false),
  ];
  nextQuestions() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  getQuestions() {
    return _questionBank[_questionNumber].QuestionString;
  }

  correctAnswer() {
    return _questionBank[_questionNumber].AnswerText;
  }

  isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    _questionNumber = 0;
  }
}

import 'package:first_app/answer.dart';
import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Blue', 'score': 20},
        {'text': 'White', 'score': 10},
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 15},
        {'text': 'Yellow', 'score': 30},
        {'text': 'Red', 'score': 25},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Elephant', 'score': 20},
        {'text': 'Snake', 'score': 20},
        {'text': 'Rabbit', 'score': 15},
        {'text': 'Lion', 'score': 30},
      ]
    },
    {
      'questionText': 'What\'s your favorite instructor ?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Mohamed', 'score': 20},
        {'text': 'Ahmed', 'score': 5},
        {'text': 'Ali', 'score': 10},
        {'text': 'Mahmoud', 'score': 5},
      ]
    },
  ];

  var _questionIndex = 0;
  int _totalScore = 0;

  void resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print('Answer Chosen!');
    if (_questionIndex < questions.length) {
      print('We have a question');
    } else {
      print('No more question');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}

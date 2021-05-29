import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //throw UnimplementedError();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = [
    {
      'questionText': 'What\'s yore favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 25},
        {'text': 'White', 'score': 14}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': -25},
        {'text': 'Elephant', 'score': 16},
        {'text': 'Lion', 'score': 12},
        {'text': 'Rick Astley', 'score': 420}
      ]
    },
    {
      'questionText': 'Što ide?',
      'answers': [
        {'text': 'Gas', 'score': 102},
        {'text': 'Ništa', 'score': -80},
        {'text': 'Crni BMW', 'score': 25}
      ],
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      print('Answer chosen!');
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First app'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore),
      ),
    );
  }
}

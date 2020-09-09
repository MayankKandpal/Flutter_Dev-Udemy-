import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './Result.dart';

void main() {
  runApp(MyApp());
}

//void main()=>runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'question text': 'What\'s your fav food?',
      'answers': [
        {'text': 'Rice', 'score': 3},
        {'text': 'Burger', 'score': 1},
        {'text': 'Pizza', 'score': 7},
        {'text': 'Momo', 'score': 8}
      ],
    },
    {
      'question text': 'What\'s your fav animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Lion', 'score': 1},
        {'text': 'Dog', 'score': 7},
        {'text': 'Cat', 'score': 8}
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz(){
    setState(() {
       _questionIndex = 0;
      _totalScore = 0;
    });
    
  }
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print(_questionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questionIndex: _questionIndex,
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                )
              : Result(_totalScore,_resetQuiz),
    ),);
  }
}

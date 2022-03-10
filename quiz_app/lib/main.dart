import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final questions = const [
    {
      'questionText': "What is your favourite animal?",
      'answers': ['Bear', 'Racoon', 'Goblin', 'Yak']
    },
    {
      'questionText': "What is your favourite color?",
      'answers': ['Black', 'Red', 'Green', 'Blue']
    },
    {
      'questionText': "What is your favourite food?",
      'answers': ['Black', 'Red', 'Green', 'Yellow']
    },
  ];
  void _answerQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build function ran");
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Quiz app"),
          ),
          body: Column(
            children: <Widget>[
              Question(questions[_questionIndex]['questionText'] as String),
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}

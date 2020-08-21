import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
  final questions = const [
    {'questionText': 'Whats\'s your favorite color?',
      'answers': ['Black','Red','Green','White']},
    {'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit','Frog','Dog','Cat','Yeet']},
    {'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit','Dog','Dog','Cat']},
    {'questionText': 'Who\'s your favorite person?',
      'answers': ['Emil','Emil','Emil','Emil']}

  ];
  var _questionIndex = 0;
  void _answerQuestion(){
    setState((){
      _questionIndex = _questionIndex + 1;
    });
    print('Answer chosen!');
    if (_questionIndex < questions.length){
      print('We have more');
    }
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My Very First App'),),
      body: _questionIndex < questions.length ? Column(
        children: [
        Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(_answerQuestion, answer);
        }).toList()

      ,Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList() ],

      ) : Center(child: Text('You did it!')),

    ),
    );
  }
}


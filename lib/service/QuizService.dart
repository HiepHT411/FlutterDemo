
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xam_app/model/quiz.dart';
import 'package:xam_app/model/result.dart';

class QuizApp extends StatefulWidget {
  const QuizApp ({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }
  final questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': -2},
        {'text': 'IOS Development Kit', 'score': -2},
        {'text': 'Web Development Kit', 'score': -2},
        {
          'text':
          'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3. Which programming language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Kotlin', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programming language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': -2},
        {'text': 'Bjarne Stroustrup', 'score': -2},
        {'text': 'Jeremy Ashkenas', 'score': -2},
      ],
    },
    {
      'questionText':
      'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'Yes',
          'score': -2,
        },
        {'text': 'No', 'score': 10},
      ],
    },
  ];

  void answerQuestion(int score) {

    setState(() {
      questionIndex = questionIndex + 1;
      totalScore += score;
    });
// ignore: avoid_print
    print(questionIndex);
    if (questionIndex < questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Icon(Icons.arrow_back)),
            title: const Text('Techcombank'),
            backgroundColor: const Color(0xFF00E676),
          ),
          body: Padding(
              padding: const EdgeInsets.all(30),
              child: questionIndex < questions.length ?
              Quiz(
                  questions: questions,
                  questionIdx: questionIndex,
                  answerQuestion: answerQuestion
              ) : Result(totalScore, resetQuiz)
          ) ,
        ),
        debugShowCheckedModeBanner: false
    );
  }
}
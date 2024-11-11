import 'package:flutter/material.dart';
import 'package:xam_app/answer.dart';
import 'package:xam_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIdx;
  final Function answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIdx,
  }) : super(key: key);
  // const Quiz({Key? key, required this.questions, required this.questionIdx, required this.answerQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText: questions[questionIdx]['questionText'].toString()),
        ...(questions[questionIdx]['answers'] as List<Map<String, Object>>)
        .map((answer) {
          return Answer(
                  answerText:  answer['text'].toString(),
                  score: int.parse(answer['score'].toString()),
                  selectHandler: () => answerQuestion(answer['score'])
                );
        }).toList()
      ],
    );
  }
}
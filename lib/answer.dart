import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  final int score;

  const Answer({required this.answerText, required this.score, required this.selectHandler, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: selectHandler,
                            style: ButtonStyle(
                              textStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white)),
                              backgroundColor: WidgetStateProperty.all(Colors.green)
                            ),
                            child: Text(answerText),
      )
    );
  }
}
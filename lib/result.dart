import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;

  final VoidCallback resetHandler;

  // const Result({super.key, required this.resultScore, required this.resetHandler});

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText = "";
    print(resultScore);
    switch (resultScore) {
      case >40:
        resultText = "Great!!!";
        break;
      case >30:
        resultText = "Pretty likable!!";
        break;
      case >20:
        resultText = "Need to work more!";
        break;
      case >10:
        resultText = "Need to work harder!";
        break;
      case > 0:
        resultText = "This is a poor score!";
        break;
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            onPressed: resetHandler,
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          // FlatButton is deprecated and should not be used
          // Use TextButton instead

          // FlatButton(
          //   child: Text(
          //     'Restart Quiz!',
          //   ), //Text
          //   textColor: Colors.blue,
          //   onPressed: resetHandler(),
          // ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
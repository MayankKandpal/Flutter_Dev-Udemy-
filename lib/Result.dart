import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore > 8) {
      resultText = 'You are awesome';
    } else {
      resultText = 'You can do better';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Reset Quiz', style: TextStyle(fontSize: 32)),
          textColor: Colors.blue,
          onPressed: resetHandler,
        )
      ],
    ));
  }
}

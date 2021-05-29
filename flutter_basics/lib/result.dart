import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  Result(this.score);
  String get resultPhrase {
    var resultText = 'You did it!';
    if (score <= 100) {
      resultText = 'Nisi gaser';
    } else if (score <= 300) {
      resultText = 'Blagi si gaser';
    } else {
      resultText = 'Ide gas';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      //child: Image.asset('assets/images/rick-astley-social.jpg'),
      child: Column(
        children: [
          Image.asset('assets/images/rick-astley-social.jpg'),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

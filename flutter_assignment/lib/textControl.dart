import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function() changeText;
  final Function() revert;
  final String text;

  TextControl(this.text, this.changeText, this.revert);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(text),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('Change Text'),
                onPressed: () => changeText(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () => revert(), child: Text('Revert Back')),
            )
          ],
        mainAxisAlignment: MainAxisAlignment.center,),
      ],
    ));
  }
}

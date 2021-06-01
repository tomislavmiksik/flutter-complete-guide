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
        ElevatedButton(
          child: Text('Change Text'),
          onPressed: () => changeText(),
        ),
        OutlinedButton(onPressed: () => revert(), child: Text('Revert Back'))
      ],
    ));
  }
}

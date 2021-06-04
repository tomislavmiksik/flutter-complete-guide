import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

@override
State<StatefulWidget> createState() {
  throw UnimplementedError();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First app'),
          centerTitle: true,
        ),
        body: Column(
          children: [Text('Gas')],
        ),
      ),
    );
  }
}

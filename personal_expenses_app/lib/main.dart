import 'package:flutter/material.dart';
import './widgets/userTransaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //String amountInput;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2d3436),
        appBar: AppBar(
          backgroundColor: Color(0xFF00b894),
          title: Text('Expense manager'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Color(0xFF00b894),
                  child: Container(
                    child: Text('[Chart]'),
                    alignment: Alignment.center,
                  ),
                  elevation: 0,
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}

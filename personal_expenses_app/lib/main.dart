import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './widgets/chart.dart';
import './widgets/newTransaction.dart';
import './widgets/transactionList.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense manager',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Color(0xFF00b894),
        fontFamily: 'OpenSans',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 0,
      title: 'New phone',
      amount: 349.99,
      date: DateTime.now(),
      transactionType: false,
    ),
    Transaction(
      id: 1,
      title: 'Paycheck',
      amount: 1000.00,
      date: DateTime.now(),
      transactionType: true,
    ),
    Transaction(
      id: 2,
      title: 'Headphones',
      amount: 459.99,
      date: DateTime.now().subtract(Duration(days: 1)),
      transactionType: false,
    )
  ];

  List<Transaction> get _recentTx {
    return _userTransactions
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(
      String title, double amount, String txType, DateTime txDate) {
    final Transaction newTransaction = Transaction(
        id: _userTransactions.length + 1,
        title: title,
        amount: amount,
        date: txDate,
        transactionType: txType == 'expense' ? false : true);
    print(_userTransactions.length.toString());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(int index) {
    setState(() {
      _userTransactions.removeAt(index);
    });
  }

  void _startNewTx(BuildContext ctx) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      backgroundColor: Color(0xFF2d3436),
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

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
          actions: [
            IconButton(
                onPressed: () => _startNewTx(context),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Color(0xFF2d3436),
                  child: Container(
                    child: Chart(_recentTx),
                    alignment: Alignment.center,
                  ),
                  elevation: 0,
                ),
              ),
              TransactionList(_userTransactions, _deleteTransaction),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF00b894),
          child: Icon(Icons.add_box),
          onPressed: () => _startNewTx(context),
        ),
      ),
    );
  }
}

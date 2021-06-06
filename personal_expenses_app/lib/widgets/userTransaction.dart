import 'package:flutter/material.dart';
import 'transactionList.dart';
import 'newTransaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1',
        title: 'New phone',
        amount: 349.99,
        date: DateTime.now(),
        transaction: false),
    Transaction(
        id: 't2',
        title: 'Paycheck',
        amount: 1000.00,
        date: DateTime.now(),
        transaction: true),
  ];

  @override
  Widget build(BuildContext context) {
    void _addNewTransaction(String title, double amount) {
      final Transaction newTransaction = Transaction(
          id: DateTime.now().toString(),
          title: title,
          amount: amount,
          date: DateTime.now(),
          transaction: false);
      setState(() {
        _userTransactions.add(newTransaction);
      });
    }

    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}

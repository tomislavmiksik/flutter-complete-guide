import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  Color getColor(bool transaction) {
    if (transaction == false) {
      return Color(0xFFe74c3c);
    } else {
      return Color(0xFF00b894);
    }
  }
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _userTransactions.reversed.map((tx) {
          return Card(
              color: getColor(tx.transaction),
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    width: 130,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '€${tx.amount.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    alignment: AlignmentDirectional.center,
                    width: 150,
                    child: Column(
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(DateFormat.yMMMd().format(tx.date),
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ));
        }).toList(),
      ),
    );
  }
}

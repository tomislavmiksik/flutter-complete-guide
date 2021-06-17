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
    int lng = _userTransactions.length;
    return Container(
      height: 430,
      child: _userTransactions.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  Text(
                    'Nothing to see here',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    color: getColor(
                        _userTransactions[lng - index - 1].transaction),
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          width: 130,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '€${_userTransactions[lng - index - 1].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          alignment: AlignmentDirectional.center,
                          width: 150,
                          child: Column(
                            children: <Widget>[
                              Text(
                                _userTransactions[lng - index - 1].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                  DateFormat.yMMMd().format(
                                      _userTransactions[lng - index - 1].date),
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )
                      ],
                    ));
              },
              itemCount: _userTransactions.length,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import '/models/transaction.dart';
import 'package:intl/intl.dart';
import './chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  List<Map<String, Object>> get groupedTxVal {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double sum = 0;
      for (int i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.year == weekDay.year) {
          sum += transactions[i].amount;
        }
        ;
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': sum
      };
    });
  }

  double get maxSpending {
    return groupedTxVal.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Color(0xff10ac84),
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTxVal.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(e['day'], e['amount'],
                  maxSpending == 0.0 ? 0.0 : (e['amount'] as double) / maxSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}

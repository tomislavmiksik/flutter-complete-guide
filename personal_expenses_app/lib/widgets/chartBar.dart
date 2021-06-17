import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double moneySpent;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.moneySpent, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('€${moneySpent.toStringAsFixed(0)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38, width: 1),
                  color: Color(0xFF95a5a6),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFe67e22),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ],
    );
  }
}

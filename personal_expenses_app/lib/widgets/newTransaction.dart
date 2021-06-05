import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _addNewTx;
  NewTransaction(this._addNewTx);


  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF00b894),
          ),
          //color: Color(0xFF00b894),
          padding: EdgeInsets.all(10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hoverColor: Colors.white,
                ),
                controller: titleController,
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixText: '€',
                  prefixStyle:
                  TextStyle(color: Colors.white, fontSize: 16),
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff10ac84),
                  ),
                  child: Text('Add transaction',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () => _addNewTx(titleController.text, double.parse(amountController.text)),
                ),
              )
            ],
          ),
        ));
  }
}

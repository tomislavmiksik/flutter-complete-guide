import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTx;

  NewTransaction(this._addNewTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String dropdownValue = 'expense';
  final titleController = TextEditingController();
  final txController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    final txType = dropdownValue;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget._addNewTx(enteredTitle, enteredAmount, txType);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF2d3436),
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
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixText: '€',
                  prefixStyle: TextStyle(color: Colors.white, fontSize: 16),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hoverColor: Colors.white,
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                onSubmitted: (_) => submitData(),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      dropdownColor: Color(0xFF2d3436),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['expense', 'income']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff10ac84),
                      ),
                      child: Text('Add transaction',
                          style: TextStyle(color: Colors.white)),
                      onPressed: submitData,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

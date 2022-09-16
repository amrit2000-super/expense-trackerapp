import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputtext = TextEditingController();
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      final enteredText = inputtext.text;
      final enteredamount = double.parse(amount.text);
      if (enteredText.isEmpty || enteredamount < 0) {
        return;
      }
      widget.addTransaction(enteredText, enteredamount, DateTime.now());
      Navigator.of(context).pop();
    }

    return Card(
        elevation: 20,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: inputtext,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amount,
                  keyboardType: TextInputType.number,
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  onPressed: () => onSubmit(),
                  textColor: Colors.purple,
                ),
              ],
            )));
  }
}

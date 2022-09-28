import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputtext = TextEditingController();
  final amount = TextEditingController();
  var datePicked = null;
  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      final enteredText = inputtext.text;
      final enteredamount = double.parse(amount.text);
      if (enteredText.isEmpty || enteredamount < 0 || datePicked == null) {
        return;
      }
      widget.addTransaction(enteredText, enteredamount, datePicked);
      Navigator.of(context).pop();
    }

    void showDate() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1912),
              lastDate: DateTime.now())
          .then((datepicked) {
        if (datepicked == null) {
          return;
        }
        setState(() {
          datePicked = datepicked;
        });
      });
    }

    return Card(
        child: Container(
            height: MediaQuery.of(context).size.height * 1,
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
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    children: [
                      datePicked == null
                          ? Text('No Date Choosen')
                          : Text(DateFormat('dd-MM-yyyy').format(datePicked)),
                      FlatButton(
                        child: Text('Choose Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () => showDate(),
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Add Transaction'),
                  onPressed: () => onSubmit(),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ],
            )));
  }
}

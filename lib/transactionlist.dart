import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List<Transactions> userTransactions = [];
  TransactionList(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: userTransactions.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'No transactions added yet',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 100,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover)),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Row(children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Text(
                          userTransactions[index].amount.toString() + '/-',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 112, 18, 128))),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.purple)),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          userTransactions[index].title,
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.black),
                        ),
                        Text(
                          DateFormat().format(userTransactions[index].date),
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.black),
                        )
                      ],
                    )
                  ]));
                },
                itemCount: userTransactions.length,
              ));
  }
}

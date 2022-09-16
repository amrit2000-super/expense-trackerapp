import 'package:flutter/material.dart';
import 'package:flutter_complete_app/new_transaction.dart';
import 'package:flutter_complete_app/transactionlist.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transactions> userTransactions = [];
  void _addTransaction(String title, double amount, DateTime date) {
    final List<Transactions> lx = [Transactions(title, amount, date)];
    setState(() {
      userTransactions.addAll(lx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return GestureDetector(
              child: NewTransaction(_addTransaction),
              onTap: () {},
              behavior: HitTestBehavior.opaque);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.purple,
            fontFamily: 'Quicksand'),
        home: Scaffold(
          appBar: AppBar(
            textTheme: TextTheme(headline2: TextStyle(fontFamily: 'OpenSans')),
            title: Text('Expense Tracker'),
            actions: [
              Builder(
                  builder: (context) => IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _startAddNewTransaction(context);
                      })),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Card(
                  color: Colors.blue,
                  child: Text('CHART!!'),
                ),
                width: double.infinity,
              ),
              TransactionList(userTransactions),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _startAddNewTransaction(context);
              },
            ),
          ),
        ));
  }
}

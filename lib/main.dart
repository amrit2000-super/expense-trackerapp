import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_app/new_transaction.dart';
import 'package:flutter_complete_app/transactionlist.dart';
import './transaction.dart';
import './chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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

  void _deleteTransactions(String title) {
    setState(() {
      userTransactions.removeWhere((tx) => (tx.title == title));
    });
  }

  List<Transactions> get recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 50),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.purple,
            errorColor: Colors.red,
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Chart(recentTransactions),
                SizedBox(
                  height: 70,
                ),
                TransactionList(userTransactions, _deleteTransactions),
              ],
            ),
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

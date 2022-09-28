import 'package:flutter/material.dart';
import 'package:flutter_complete_app/chart_bar.dart';
import 'package:intl/intl.dart';
import './transaction.dart';
import './chart_bar.dart';
import './new_transaction.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;
  Chart(this.recentTransactions);
  var sum = 0.0;
  List<Map<String, Object>> get _groupedTransactions {
    return List.generate(7, (index) {
      sum = 0.0;
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          sum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': sum};
    }).reversed.toList();
  }

  double get _totalSum {
    return _groupedTransactions.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ..._groupedTransactions.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
                data['day'] as String,
                data['amount'] as double,
                (_totalSum == 0
                    ? 0.0
                    : (data['amount'] as double) / _totalSum as double)),
          );
        }).toList(),
      ]),
    );
  }
}

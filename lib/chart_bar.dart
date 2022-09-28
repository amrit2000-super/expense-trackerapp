import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendngperTotal;

  ChartBar(this.label, this.spendingAmount, this.spendngperTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: FittedBox(
            child: Text('${spendingAmount.toStringAsFixed(0)}'),
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 50,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                  heightFactor: spendngperTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50)),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}

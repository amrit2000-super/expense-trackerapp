import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';
import './main.dart';

class TransactionList extends StatelessWidget {
  List<Transactions> userTransactions = [];
  final Function deleteTransactions;
  TransactionList(this.userTransactions, this.deleteTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
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
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('${userTransactions[index].amount}'),
                        ),
                        radius: 50,
                      ),
                      title: Text(userTransactions[index].title),
                      subtitle: Text(DateFormat('dd-MM-yyyy')
                          .format(userTransactions[index].date)),
                      trailing: Builder(
                          builder: (context) => IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => deleteTransactions(
                                    userTransactions[index].title),
                                color: Theme.of(context).errorColor,
                              )),
                    ),
                  );
                },
                itemCount: userTransactions.length,
              ));
  }
}

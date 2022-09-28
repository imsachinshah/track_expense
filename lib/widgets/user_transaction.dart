import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1st',
      name: 'Chicken',
      date: DateTime.now(),
      price: 330,
    ),
    Transaction(
      id: '2nd',
      name: 'Shopping',
      date: DateTime.now(),
      price: 5000,
    )
  ];

  void _addNewTransaction(String txName, double txPrice) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      name: txName,
      date: DateTime.now(),
      price: txPrice,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}

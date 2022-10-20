import 'package:flutter/material.dart';
import 'package:track_expense/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KharchAAA",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // colorScheme: const ColorScheme.light(),
        fontFamily: 'OpenSans',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: '1st',
    //   name: 'Chicken',
    //   date: DateTime.now(),
    //   price: 330,
    // ),
    // Transaction(
    //   id: '2nd',
    //   name: 'Shopping',
    //   date: DateTime.now(),
    //   price: 5000,
    // )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
           const Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KharchAAA'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(
              transactions: _userTransactions,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:track_expense/widgets/new_transaction.dart';

import 'models/transaction.dart';
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
          children: [
            Container(
              // decoration: BoxDecoration(
              //   color: Colors.red,
              // ),

              padding: const EdgeInsets.all(10),
              child: Card(
                color: Theme.of(context).primaryColorLight,
                child: const Text("Chart"),
              ),
            ),
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

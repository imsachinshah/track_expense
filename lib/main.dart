import 'package:flutter/material.dart';
import 'package:track_expense/transaction.dart';
import 'package:intl/intl.dart';

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
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Transaction> transactions = [
    Transaction(id: '1st', name: 'Chicken', date: DateTime.now(), price: 330),
    Transaction(id: '1st', name: 'Shopping', date: DateTime.now(), price: 5000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KharchAAA'),
      ),
      body: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.red,
            // ),
            padding: const EdgeInsets.all(10),
            child: const Card(
              color: Colors.red,
              child: Text("Chart"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          width: 2,
                          color: Colors.red,
                        ),
                      ),
                      child: Text(
                        '\$${tx.price}',
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          tx.name,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          DateFormat('dd/MM/yy').format(tx.date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

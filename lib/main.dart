import 'package:flutter/material.dart';

import 'package:track_expense/widgets/user_transaction.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          const UserTransaction()
        ],
      ),
    );
  }
}

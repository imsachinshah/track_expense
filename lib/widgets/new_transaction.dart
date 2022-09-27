import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: InputBorder.none,
                hintText: 'Kaha Udaya Paisa',
              ),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: InputBorder.none,
                hintText: 'Kitna Udaya Paisa',
              ),
            ),
            TextButton(
              onPressed: () {
                print(amountController.value);
              },
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}

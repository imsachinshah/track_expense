import 'package:flutter/material.dart';


class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function tx;

  NewTransaction(this.tx, {Key? key}) : super(key: key);

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
                tx(titleController.text, double.parse(amountController.text));
              },
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function tx;

  NewTransaction(this.tx, {Key? key}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    tx(
      enteredTitle,
      enteredAmount,
    );
  }

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
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: InputBorder.none,
                hintText: 'Kitna Udaya Paisa',
              ),
              onSubmitted: (_) => submitData,
            ),
            TextButton(
              onPressed: submitData,
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}

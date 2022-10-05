import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function tx;

  const NewTransaction(this.tx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.tx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.pop(context);
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

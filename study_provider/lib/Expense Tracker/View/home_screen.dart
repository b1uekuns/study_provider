import 'package:flutter/material.dart';
import 'package:study_provider/Expense%20Tracker/Widgets/add_transaction.dart';
import 'package:study_provider/Expense%20Tracker/Widgets/transaction_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker')
        ),
      body: const Column(
        children: [Expanded(child: TransactionList())]
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddTransaction(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

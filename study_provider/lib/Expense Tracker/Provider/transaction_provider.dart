import 'package:flutter/material.dart';
import 'package:study_provider/Expense%20Tracker/Model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  //for calculating the total income
  double get totalIncome => _transactions
      .where((tx) => tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);
  //for calculating the total expenses
  double get totalExpenses => _transactions
      .where((tx) => !tx.isIncome)
      .fold(0, (sum, tx) => sum + tx.amount);
  //for the remaining balance
  double get remainingBalance => totalIncome - totalExpenses;
  //method to add a new transaction
  void addTransaction(String title, double amount, bool isIncome) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
      isIncome: isIncome,
    );
    _transactions.insert(0, newTransaction);
    notifyListeners();
  }

  //method to remove a transaction
  void removeTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}

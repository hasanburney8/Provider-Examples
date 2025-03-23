import 'package:flutter/cupertino.dart';
import 'package:provider_projects/model/example_6_expense_tracker_model.dart';

class ExpenseTrackerProvider extends ChangeNotifier{
  final List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  //for total income   ---------------->>>>>>>>>>> todo: tx is just a temporary variable that holds each transaction object during iteration.
  double get totalIncome => _transactions.
  where((tx) => tx.isIncome). //todo: filters the list, returning only transactions where isIncome is true.
  fold(0, (sum, tx) => sum + tx.amount) ; //todo: is used to sum up the amounts of all income transactions.

  //for total expense
  double get totalExpense => _transactions.
  where((tx) => !tx.isIncome).
  fold(0, (sum, tx) => sum + tx.amount) ;

  //for the remaining balance
  double get remainingBalance => totalIncome-totalExpense;

  //method to add a transaction
  void addTransaction(String title, double amount, bool isIncome){
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


  //method to remove
  void removeTransaction(String id){
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
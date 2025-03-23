import 'package:flutter/material.dart';
import 'package:provider_projects/widgets/add_transaction.dart';
import 'package:provider_projects/widgets/summary_card.dart';
import 'package:provider_projects/widgets/transaction_list.dart';

class ExpenseTrackerScreen extends StatefulWidget {
  const ExpenseTrackerScreen({super.key});

  @override
  State<ExpenseTrackerScreen> createState() => _ExpenseTrackerScreenState();
}

class _ExpenseTrackerScreenState extends State<ExpenseTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          SummaryCard(),
          Expanded(
              child: TransactionList()
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (_) => AddTransaction(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

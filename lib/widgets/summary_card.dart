// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/example_6_expense_tracker_provider.dart';
//
// class SummaryCard extends StatelessWidget {
//   const SummaryCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final expenseTrackerProvider = Provider.of<ExpenseTrackerProvider>(context);
//
//     return Card(
//       margin: const EdgeInsets.all(16),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text('Monthly Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
//             const SizedBox(height: 8,),
//             Row(
//               children: [
//                 Text('Total Income: \$${expenseTrackerProvider.totalIncome.toStringAsFixed(2)}'),
//                 Text('Total Expense: \$${expenseTrackerProvider.totalExpense.toStringAsFixed(2)}'),
//               ],
//             ),
//             const SizedBox(height: 10,),
//             Text('Remaining Balance: \$${expenseTrackerProvider.remainingBalance.toStringAsFixed(2)}',
//             style: TextStyle(fontWeight: FontWeight.bold),),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/example_6_expense_tracker_provider.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseTrackerProvider = Provider.of<ExpenseTrackerProvider>(context);

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Summary',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(thickness: 1, height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Income:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '\$${expenseTrackerProvider.totalIncome.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Expense:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '\$${expenseTrackerProvider.totalExpense.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Remaining Balance: \$${expenseTrackerProvider.remainingBalance.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

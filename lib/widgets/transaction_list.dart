import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../provider/example_6_expense_tracker_provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseTrackerProvider = Provider.of<ExpenseTrackerProvider>(context);

    return ListView.builder(
      itemCount: expenseTrackerProvider.transactions.length,
      itemBuilder: (context, index) {
        final tx = expenseTrackerProvider.transactions[index];
        final isIncome = tx.isIncome;
        final currency = NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(tx.amount);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: isIncome
                    ? [Colors.green.shade400, Colors.green.shade700]
                    : [Colors.red.shade400, Colors.red.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: isIncome ? Colors.green.shade200 : Colors.red.shade200,
                  blurRadius: 8,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              onLongPress: () {
                expenseTrackerProvider.removeTransaction(tx.id);
              },
              leading: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.3),
                radius: 28,
                child: Icon(
                  isIncome ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              title: Text(
                tx.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(tx.date),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              trailing: Text(
                currency,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}



//ListView.builder(
//         itemCount: expenseTrackerProvider.transactions.length,
//         itemBuilder: (contxt, index){
//           final tx = expenseTrackerProvider.transactions[index];
//           return GestureDetector(
//             onLongPress: (){
//               expenseTrackerProvider.removeTransaction(tx.id);
//             },
//             child: ListTile(
//               title: Text(tx.title),
//               subtitle: Text(tx.date.toString()),
//               trailing: Text(
//                 '\$${tx.amount.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   color: tx.isIncome ? Colors.green : Colors.red,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           );
//         }
//     )
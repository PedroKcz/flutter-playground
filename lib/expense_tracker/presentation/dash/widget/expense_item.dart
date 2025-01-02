import 'package:flutter/material.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';
import 'package:hello_world/expense_tracker/presentation/dash/widget/expense_extension.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this._expense, {super.key});

  final Expense _expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_expense.title),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('\$${_expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(_expense.category.icon),
                    const SizedBox(width: 8),
                    Text(_expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

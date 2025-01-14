import 'package:flutter/material.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';
import 'package:hello_world/expense_tracker/domain/model/expense_category.dart';
import 'package:intl/intl.dart';

extension ExpenseCategoryExtension on ExpenseCategory {
  IconData get icon {
    return switch (this) {
      ExpenseCategory.food => Icons.lunch_dining,
      ExpenseCategory.leisure => Icons.movie,
      ExpenseCategory.travel => Icons.flight_takeoff,
      ExpenseCategory.work => Icons.work,
    };
  }

  Color get color {
    return switch (this) {
      ExpenseCategory.food => Colors.yellow.shade900,
      ExpenseCategory.leisure => Colors.blueAccent.shade700,
      ExpenseCategory.travel => Colors.green,
      ExpenseCategory.work => Colors.deepPurple,
    };
  }
}

extension ExpenseExtension on Expense {
  static final formatter = DateFormat.yMMMMd();

  String get formattedDate {
    return formatter.format(this.date);
  }
}

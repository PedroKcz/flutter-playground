import 'package:flutter/material.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';
import 'package:hello_world/expense_tracker/domain/model/expense_category.dart';
import 'package:intl/intl.dart';

extension ExpenseCategoryExtension on ExpenseCategory {
  IconData get icon {
    return switch (this) {
      ExpenseCategory.food => Icons.lunch_dining,
      ExpenseCategory.leisure => Icons.flight_takeoff,
      ExpenseCategory.travel => Icons.movie,
      ExpenseCategory.work => Icons.work,
    };
  }
}

extension ExpenseExtension on Expense {
  static final formatter = DateFormat.yMMMMd();

  String get formattedDate {
    return formatter.format(this.date);
  }
}

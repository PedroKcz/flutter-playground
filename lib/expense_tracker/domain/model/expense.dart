import 'package:equatable/equatable.dart';
import 'package:hello_world/expense_tracker/domain/model/expense_category.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Expense extends Equatable {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    String? id,
  }) : this.id = id ?? _uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense copyWith({
    String? title,
    double? amount,
    DateTime? date,
    ExpenseCategory? category,
  }) {
    return Expense(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [id, title, amount, date, category];
}

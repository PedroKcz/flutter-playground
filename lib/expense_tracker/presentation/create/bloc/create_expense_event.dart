import 'package:equatable/equatable.dart';
import 'package:hello_world/expense_tracker/domain/model/expense_category.dart';

sealed class CreateExpenseEvent extends Equatable {
  const CreateExpenseEvent();
}

class TitleUpdated extends CreateExpenseEvent {
  const TitleUpdated({required this.title});

  final String title;

  @override
  List<Object?> get props => [title];
}

class AmountUpdated extends CreateExpenseEvent {
  const AmountUpdated({required this.amount});

  final String amount;

  @override
  List<Object?> get props => [amount];
}

class CategorySelected extends CreateExpenseEvent {
  const CategorySelected({required this.category});

  final ExpenseCategory category;

  @override
  List<Object?> get props => [category];
}

class DateSelected extends CreateExpenseEvent {
  const DateSelected({required this.date});

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

class Submit extends CreateExpenseEvent {
  const Submit();

  @override
  List<Object?> get props => [];
}

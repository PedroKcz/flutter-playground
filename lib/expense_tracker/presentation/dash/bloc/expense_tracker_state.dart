import 'package:equatable/equatable.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';

sealed class ExpenseTrackerState extends Equatable {
  const ExpenseTrackerState();
}

class LoadingState extends ExpenseTrackerState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class ExpensesState extends ExpenseTrackerState {
  const ExpensesState(this.expenses);

  final List<Expense> expenses;

  @override
  List<Object?> get props => [expenses];
}

class ErrorState extends ExpenseTrackerState {
  const ErrorState();

  @override
  List<Object?> get props => [];
}

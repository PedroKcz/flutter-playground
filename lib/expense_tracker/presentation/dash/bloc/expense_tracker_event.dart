import 'package:equatable/equatable.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';

sealed class ExpenseTrackerEvent extends Equatable {
  const ExpenseTrackerEvent();
}

class FindExpense extends ExpenseTrackerEvent {
  const FindExpense();

  @override
  List<Object?> get props => [];
}

class DeleteExpense extends ExpenseTrackerEvent {
  const DeleteExpense(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}


class AddExpense extends ExpenseTrackerEvent {
  const AddExpense(this.expense);

  final Expense expense;

  @override
  List<Object?> get props => [expense];
}

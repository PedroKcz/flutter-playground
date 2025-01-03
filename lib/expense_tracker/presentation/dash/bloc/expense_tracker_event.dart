import 'package:equatable/equatable.dart';

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

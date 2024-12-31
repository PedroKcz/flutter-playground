import 'package:equatable/equatable.dart';

sealed class ExpenseTrackerEvent extends Equatable {
  const ExpenseTrackerEvent();
}

class FindExpense extends ExpenseTrackerEvent {
  const FindExpense();

  @override
  List<Object?> get props => [];
}

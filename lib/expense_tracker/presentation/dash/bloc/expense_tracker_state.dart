import 'package:equatable/equatable.dart';

sealed class ExpenseTrackerState extends Equatable {}

class LoadingState extends ExpenseTrackerState {
  @override
  List<Object?> get props => [];
}

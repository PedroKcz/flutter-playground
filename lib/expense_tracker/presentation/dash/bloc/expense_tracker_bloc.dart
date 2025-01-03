import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/expense_tracker/domain/expenses_repository.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';
import 'package:hello_world/expense_tracker/presentation/dash/bloc/expense_tracker_event.dart';
import 'package:hello_world/expense_tracker/presentation/dash/bloc/expense_tracker_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExpenseTrackerBloc
    extends Bloc<ExpenseTrackerEvent, ExpenseTrackerState> {
  ExpenseTrackerBloc(this._repository) : super(const LoadingState()) {
    on<FindExpense>(_observeExpenses);
    on<DeleteExpense>(_deleteExpense);
    on<AddExpense>(_addExpense);
  }

  final ExpensesRepository _repository;

  Future<void> _observeExpenses(
    FindExpense event,
    Emitter<ExpenseTrackerState> emit,
  ) async {
    emit(const LoadingState());

    await emit.forEach<List<Expense>>(
      _repository.observeExpenses(),
      onData: (expenses) =>
          ExpensesState(expenses..sort((a, b) => b.date.compareTo(a.date))),
      onError: (_, __) => const ErrorState(),
    );
  }

  void _deleteExpense(DeleteExpense event, Emitter<ExpenseTrackerState> emit) {
    _repository.deleteExpense(event.id);
  }

  void _addExpense(AddExpense event, Emitter<ExpenseTrackerState> emit) {
    _repository.saveExpense(event.expense);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/expense_tracker/domain/expenses_repository.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_event.dart';
import 'package:hello_world/expense_tracker/presentation/create/bloc/create_expense_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  CreateExpenseBloc(this._repository) : super(CreateExpenseState()) {
    on<TitleUpdated>(_updateTitle);
    on<AmountUpdated>(_updateAmount);
    on<DateSelected>(_selectDate);
    on<CategorySelected>(_selectCategory);
    on<Submit>(_submit);
  }

  final ExpensesRepository _repository;

  void _updateTitle(TitleUpdated event, Emitter<CreateExpenseState> emit) {
    emit(
      state.copyWith(expense: state.expense.copyWith(title: event.title)),
    );
  }

  void _updateAmount(AmountUpdated event, Emitter<CreateExpenseState> emit) {
    final amount = double.tryParse(event.amount);
    emit(
      state.copyWith(
        expense: state.expense.copyWith(
          amount: amount != null ? amount : 0,
        ),
        showError: amount == null,
      ),
    );
  }

  void _selectDate(DateSelected event, Emitter<CreateExpenseState> emit) {
    emit(
      state.copyWith(expense: state.expense.copyWith(date: event.date)),
    );
  }

  void _selectCategory(
    CategorySelected event,
    Emitter<CreateExpenseState> emit,
  ) {
    emit(
      state.copyWith(expense: state.expense.copyWith(category: event.category)),
    );
  }

  void _submit(Submit event, Emitter<CreateExpenseState> emit) async {
    try {
      assert(state.isSubmitButtonEnabled);
      emit(state.copyWith(isLoading: true));
      await _repository.saveExpense(state.expense);
      emit(state.copyWith(isLoading: false, isExpenseSaved: true));
    } catch (_) {
      emit(state.copyWith(isLoading: false, showError: true));
    }
  }
}

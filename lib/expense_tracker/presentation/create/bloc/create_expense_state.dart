import 'package:equatable/equatable.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';
import 'package:hello_world/expense_tracker/domain/model/expense_category.dart';

class CreateExpenseState extends Equatable {
  CreateExpenseState({
    Expense? expense,
    bool this.isLoading = false,
    bool this.isExpenseSaved = false,
    bool this.showError = false,
  }) : this.expense = expense ??
            Expense(
              title: '',
              amount: 0,
              date: DateTime.now(),
              category: ExpenseCategory.food,
            );

  final Expense expense;
  final bool isLoading;
  final bool isExpenseSaved;
  final bool showError;

  bool get isSubmitButtonEnabled {
    return expense.title.trim().isNotEmpty && expense.amount > 0 && !isLoading;
  }

  CreateExpenseState copyWith({
    Expense? expense,
    bool? isLoading,
    bool? isExpenseSaved,
    bool showError = false,
  }) {
    return CreateExpenseState(
      expense: expense ?? this.expense,
      isLoading: isLoading ?? this.isLoading,
      isExpenseSaved: isExpenseSaved ?? this.isExpenseSaved,
      showError: showError,
    );
  }

  @override
  List<Object?> get props => [expense, isLoading, isExpenseSaved, showError];
}

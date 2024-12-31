import 'package:hello_world/expense_tracker/domain/model/expense.dart';

abstract class ExpensesRepository {
  const ExpensesRepository();

  Stream<List<Expense>> observeExpenses();

  Future<void> saveExpense(Expense expense);

  Future<void> deleteExpense(String id);

  Future<void> close();
}

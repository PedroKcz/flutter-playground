import 'dart:convert';

import 'package:hello_world/expense_tracker/data/dto/expense_dto.dart';
import 'package:hello_world/expense_tracker/domain/expenses_repository.dart';
import 'package:hello_world/expense_tracker/domain/model/expense.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';

@Singleton(as: ExpensesRepository)
class ExpensesRepositoryImpl extends ExpensesRepository {
  ExpensesRepositoryImpl({required this.prefs}) {
    _init();
  }

  static const _expensesKey = 'expenses_key';
  final SharedPreferences prefs;

  late final _expensesStreamController = BehaviorSubject<List<Expense>>.seeded(
    const [],
  );

  String? _getValue(String key) => prefs.getString(key);
  Future<void> _setValue(String key, String value) =>
      prefs.setString(key, value);

  void _init() {
    final expensesJson = _getValue(_expensesKey);
    if (expensesJson != null) {
      final expenses = List<Map<dynamic, dynamic>>.from(
        json.decode(expensesJson) as List,
      )
          .map(
            (jsonMap) =>
                ExpenseDto.fromJson(Map<String, dynamic>.from(jsonMap)),
          )
          .map(
            (dto) => Expense(
              title: dto.title,
              amount: dto.amount,
              date: dto.date,
              category: dto.category,
              id: dto.id,
            ),
          )
          .toList();
      _expensesStreamController.add(expenses);
    } else {
      _expensesStreamController.add(const []);
    }
  }

  @override
  Future<void> deleteExpense(String id) async {
    final expenses = [..._expensesStreamController.value];
    final expenseIndex = expenses.indexWhere((e) => e.id == id);
    if (expenseIndex != -1) {
      expenses.removeAt(expenseIndex);
      _expensesStreamController.add(expenses);
      return _setValue(_expensesKey, encodeExpenses(expenses));
    }
  }

  @override
  Stream<List<Expense>> observeExpenses() =>
      _expensesStreamController.asBroadcastStream();

  @override
  Future<void> saveExpense(Expense expense) async {
    final expenses = [..._expensesStreamController.value];
    final expenseIndex = expenses.indexWhere((e) => e.id == expense.id);
    if (expenseIndex >= 0) {
      expenses[expenseIndex] = expense;
    } else {
      expenses.add(expense);
    }

    _expensesStreamController.add(expenses);
    return _setValue(_expensesKey, encodeExpenses(expenses));
  }

  String encodeExpenses(List<Expense> expenses) => json.encode(
        expenses.map(
          (expense) => ExpenseDto(
            id: expense.id,
            title: expense.title,
            amount: expense.amount,
            date: expense.date,
            category: expense.category,
          ),
        ),
      );

  @override
  Future<void> close() {
    return _expensesStreamController.close();
  }
}

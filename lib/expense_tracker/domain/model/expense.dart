import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;

  @override
  List<Object?> get props => [id, title, amount, date];
}

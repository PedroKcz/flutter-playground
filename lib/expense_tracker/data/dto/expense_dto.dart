import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/expense_tracker/domain/model/expense_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_dto.g.dart';

@immutable
@JsonSerializable()
class ExpenseDto extends Equatable {
  ExpenseDto({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  ExpenseDto copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
    ExpenseCategory? category,
  }) {
    return ExpenseDto(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  static ExpenseDto fromJson(Map<String, dynamic> json) =>
      _$ExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDtoToJson(this);

  @override
  List<Object?> get props => [id, title, amount, date, category];
}

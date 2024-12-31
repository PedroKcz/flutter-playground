import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;

  ExpenseDto copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
  }) {
    return ExpenseDto(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  static ExpenseDto fromJson(Map<String, dynamic> json) =>
      _$ExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDtoToJson(this);

  @override
  List<Object?> get props => [id, title, amount, date];
}

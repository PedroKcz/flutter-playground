import 'package:equatable/equatable.dart';

class Question extends Equatable {
  Question({
    required this.title,
    required this.answers,
    required this.correctAnswer,
  });

  final String title;
  final List<String> answers;
  final String correctAnswer;

  @override
  List<Object?> get props => [title, answers, correctAnswer];
}

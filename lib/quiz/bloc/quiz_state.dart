import 'package:equatable/equatable.dart';
import 'package:hello_world/quiz/model/question.dart';

sealed class QuizState extends Equatable {
  const QuizState();
}

final class QuizQuestion extends QuizState {
  const QuizQuestion(this.currentQuestion);

  final Question currentQuestion;

  @override
  List<Object> get props => [currentQuestion];
}

final class QuizResult extends QuizState {
  const QuizResult(this.summary, this.questions);

  final String summary;
  final Map<Question, bool> questions;

  @override
  List<Object> get props => [summary, questions];
}

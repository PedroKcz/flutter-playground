import 'package:equatable/equatable.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();
}

final class QuestionAnswered extends QuizEvent {
  const QuestionAnswered(this.answer);

  final String answer;

  @override
  List<Object> get props => [answer];
}

final class QuizReset extends QuizEvent {
  const QuizReset();

  @override
  List<Object> get props => [];
}

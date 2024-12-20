import 'package:hello_world/quiz/question.dart';

sealed class QuizState {
  const QuizState();
}

final class QuizQuestion extends QuizState {
  const QuizQuestion(this.currentQuestion);

  final Question currentQuestion;
}

final class QuizResult extends QuizState {
  const QuizResult(this.summary, this.questions);

  final String summary;
  final List<Question> questions;
}
